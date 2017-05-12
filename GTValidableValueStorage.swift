//
//  GTValidateCellInfo.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/28.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation

open class GTValidableValueStorage {
    var value: String? {
        willSet(newValue){
            print("will set \(String(describing: value))")
            self.tempOldValue = value
        }
        
        didSet{
            print("did set \(String(describing: value))")
            self.valueUpdateListener?.storage(storage: self, updateValuefrom: tempOldValue, toValue: value)
        }
    }
    
    fileprivate var tempOldValue: String? = nil
    
    ///If complection block has value, will fire checking process
    func updateValueString(with string:String?, shouldCheck:Bool = false, checkCompletion:  (() -> Void)? = nil){
        self.value = string
        switch self.validateInfo.keyboardType! {
        case .basic, .decimal, .number:
            break
        case .datePicker(let info):
            if let dateString = string {
                let formatter = DateFormatter.init()
                formatter.dateFormat = info.dateFormat
                let date = formatter.date(from: dateString) ?? Date.init()
                self.containedView?.datePicker?.setDate(date, animated: true)
            }
        case .picker(_):
            break
        }
        
        if shouldCheck || (checkCompletion != nil) {
            if let completion = checkCompletion {
                self.checkValidity(completion: completion)
            }
        } else {
            //if is update programmatically, value must be passed from server, or local storage, which here we assume is valid already, only need to check is nullable or not.
            if let _ = string {
                self.isContentValid = true
            }else{
                //如果由系統自動判定輸入是否正確，在picker的狀態下需要藉由nullable和輸入資料共同判斷正確性。
                self.isContentValid = self.validateInfo.nullable
            }
        }
    }
    
    var validateInfo:GTValidateInfo!
    var isContentValid: Bool = false
    
    var valueUpdateListener: GTValidableValueStorageUpdateListener?
    
    var containerType: ContainerType! = .textField
    weak var containedView: GTValidableViewInterface?
    
    
    init(with validateInfo:GTValidateInfo, value: String? = nil, containerType: ContainerType){
        self.validateInfo = validateInfo
        self.value = value
        self.containerType = containerType
        
        self.isContentValid = validateInfo.nullable
    }
    
    convenience init(with validateInfo:GTValidateInfo, value: String? = nil){
        self.init(with: validateInfo, value: value, containerType: .textField)
    }
    
    func checkValidity(completion: @escaping () -> Void){
        self.validateInfo.checkValidity(with: value, completion: {
            (result) in
                self.isContentValid = result
                completion()
        })
    }
    
    func getValue() -> Any? {
        switch self.validateInfo.keyboardType! {
        case .basic, .decimal, .number:
            return self.value
            
        case .picker(let values):
            guard let _ = self.containedView else{
                print("Warning - trying to get picker keyboard value, but no data picker was found.")
                return nil
            }
            
            if let valueString = self.value {
                for pickerValue in values {
                    if let displayTitleStringOfValue = pickerValue.pickerSelectContentTitle, displayTitleStringOfValue == valueString {
                        return pickerValue
                    }
                }
                
                return nil
            }else{
                print("Picker has not select any row")
                return nil
            }
        case .datePicker(_):
            guard let containedView = self.containedView, let datePicker = containedView.datePicker else{
                print("Warning - trying to get date picker keyboard value, but no date picker was found.")
                return nil
            }
            
            return datePicker.date
        }
    }
}
