//
//  GTValidateCellInfo.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/28.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation
import RxSwift

open class GTValidableValueStorage {
    enum ContentValidityError : Error {
        case empty
        case regexFail
        case verifyFail(reason: String)
        
        //LOC:
        var desc: String {
            switch self {
            case .empty:
                return "Content Is Empty".localized
            case .regexFail:
                return "Incorrect Format".localized
            case .verifyFail(reason: let r):
                return r
            }
        }
        
    }
    
    enum ContentValidityResult {
        case valid
        case invalid(reason: String)
    }
    
    var valueVar: Variable<String?> {
        willSet(newValue){
            print("will set \(String(describing: valueVar.value))")
            self.tempOldValue = valueVar.value
        }
        
        didSet{
            print("did set \(String(describing: valueVar.value))")
//            self.valueUpdateListener?.storage(storage: self, updateValuefrom: tempOldValue, toValue: valueVar.value)
        }
    }
    
    var verifyLogics: [GTValueStorageValidator.Logic]?
    
    fileprivate var tempOldValue: String? = nil
    fileprivate var disposeBag = DisposeBag.init()
    
    ///If complection block has value, will fire checking process
    func updateValueString(with string:String?, shouldCheck:Bool = false){
        self.valueVar.value = string
        switch self.validateInfo.keyboardType! {
        case .basic, .decimal, .number:
            break
        case .datePicker(let varInfo):
            if let dateString = string {
                let formatter = DateFormatter.init()
                formatter.dateFormat = varInfo.dateFormat
                let date = formatter.date(from: dateString) ?? Date.init()
                self.containedView?.datePicker?.setDate(date, animated: true)
            }
        case .picker(_):
            break
        }
        
        if shouldCheck {
            checkValidity()
        } else {
            //if is update programmatically, value must be passed from server, or local storage, which here we assume is valid already, only need to check is nullable or not.
            if let _ = string {
                self.validResultVar.value = .valid
            }else{
                //如果由系統自動判定輸入是否正確，在picker的狀態下需要藉由nullable和輸入資料共同判斷正確性。
                if self.validateInfo.nullable {
                    validResultVar.value = .valid
                }else {
                    validResultVar.value = .invalid(reason: ContentValidityError.empty.desc)
                }
            }
        }
    }
    
    var validateInfo:GTValidateInfo!
//    var isContentValid: Bool = false
    var validResultVar: Variable<ContentValidityResult> = Variable.init(.invalid(reason: ContentValidityError.empty.desc))
    
//    var valueUpdateListener: GTValidableValueStorageUpdateListener?
    
    var containerType: ContainerType! = .textField
    weak var containedView: GTValidableViewInterface?
    
    
    init(with validateInfo:GTValidateInfo, value: String? = nil, containerType: ContainerType){
        self.validateInfo = validateInfo
        self.valueVar = Variable(value)
        self.containerType = containerType
        
        if self.validateInfo.nullable {
            validResultVar.value = .valid
        }else {
            validResultVar.value = .invalid(reason: ContentValidityError.empty.desc)
        }
        
        valueVar.asObservable().skip(1)
            .debounce(1, scheduler: MainScheduler.asyncInstance)
            .distinctUntilChanged({ (s1, s2) -> Bool in
                print("Now compare \(s1) to \(s2)")
                return s1 == s2
            })
            .debug("Value var observe to check validity")
            .subscribe(onNext: {[weak self] value in
                self?.checkValidity()
            }).addDisposableTo(disposeBag)
    }
    
    convenience init(with validateInfo:GTValidateInfo, value: String? = nil){
        self.init(with: validateInfo, value: value, containerType: .textField)
    }
    
    func checkValidity(){
        
        checkRegexValidity(content: valueVar.value)
        .flatMap ({ (validResult) -> Observable<ContentValidityResult> in
            switch validResult {
            case .valid:
                if let logics = self.verifyLogics, logics.count > 0 {
                    var logicFlow: Observable<ContentValidityResult>?
                    //Binding all logics to an obersver flow, will return first encounter invalid result.
                    for logic in logics {
                        let logicCheck = GTValueStorageValidator.check(logic: logic)
                        let mapResult = logicCheck.map({ (checkResult) -> ContentValidityResult  in
                            return checkResult
                        })
                        
                        if let flow = logicFlow {
                            logicFlow = flow.flatMap({ result -> Observable<ContentValidityResult> in
                                switch result {
                                case .valid:
                                    return mapResult
                                case .invalid:
                                    return Observable.just(result)
                                }
                            })
                        }else {
                            logicFlow = mapResult
                        }
                    }
                    
                    return logicFlow!
                }else {
                    return Observable.just(ContentValidityResult.valid)
                }
            case .invalid(reason: _):
                return Observable.just(validResult)
            }
        }).subscribe(onNext: { result in
            self.validResultVar.value = result
        }).addDisposableTo(disposeBag)
        
    }
    
    private func checkRegexValidity(content: String?) -> Observable<ContentValidityResult> {
        let info = validateInfo!
        guard let c = content, c.lengthOfBytes(using: .utf8) > 0 else{
            print("Notice: valid content length is nil, will return true if value is nullable")
            if info.nullable {
                return Observable.just(ContentValidityResult.valid)
            }else {
                return Observable.just(ContentValidityResult.invalid(reason: ContentValidityError.empty.desc))
            }
        }
        
        guard let pattern = info.regex, pattern.lengthOfBytes(using: .utf8) > 0 else {
            print("Notice: No regex pattern for validate info : \(info.name)")
            
            return Observable.just(ContentValidityResult.valid)
        }
        
        guard let reg = try? NSRegularExpression.init(pattern: pattern, options: .caseInsensitive) else {
            print("Notice: regex pattern is invalid for validate info : \(info.name), regex : \(pattern)")
            
            return Observable.just(ContentValidityResult.valid)
        }
        
        let range = NSMakeRange(0, c.lengthOfBytes(using: .utf8))
        let match = reg.rangeOfFirstMatch(in: c, options: .reportProgress, range: range)
        
        let valid = match.location != NSNotFound
        
        if valid {
            return Observable.just(ContentValidityResult.valid)
        }else {
            return Observable.just(ContentValidityResult.invalid(reason: ContentValidityError.regexFail.desc))
        }
    }
    
    func getValue() -> Any? {
        switch self.validateInfo.keyboardType! {
        case .basic, .decimal, .number:
            return self.valueVar.value
            
        case .picker(let values):
            guard let _ = self.containedView else{
                print("Warning - trying to get picker keyboard value, but no data picker was found.")
                return nil
            }
            
            if let valueString = self.valueVar.value {
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
