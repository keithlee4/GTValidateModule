//
//  GTValidateInfo.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/11.
//  Copyright © 2016年 git4u. All rights reserved.
//

import UIKit
import RxSwift

open class GTValidateInfo: NSObject, GTValidateInfoInterface {
    var name: String!
    var placeholderText: String!
    var regex: String?
    var keyboardType: GTKeyboardType!
    var fieldKey: String!
    var secured: Bool!
//    var containerInfo: GTValidateContainerInfo!
    var nullable: Bool!
    
//    var validateDelegate: GTInfoValidateInfoDelegate?
    
    init(_ validateStruct: GTValidateStruct) {
        super.init()
        
        let name = validateStruct.name
        let placeholder = validateStruct.placeHolder
        let regex = validateStruct.regex
        let fieldKey = validateStruct.fieldKey
        let secured = validateStruct.isSecured
        let nullable = validateStruct.isNullable
        let keyboardType = validateStruct.keyboard
    
        self.name = name
        self.placeholderText = placeholder
        self.regex = regex
        self.keyboardType = keyboardType
        self.fieldKey = fieldKey
        self.secured = secured
        self.nullable = nullable
    }
    
    //completion block 主要用於 回傳給value storage並且儲存驗證狀態( for model )，delegate主要用於反映給controller並且update UI。
//    func checkValidity(with contentText: String?, completion: @escaping (Bool) -> Void) {
//        if let validateDelegate = self.validateDelegate {
//            validateDelegate.validateInfoWillStartCheckingValidity(self)
//        }
//        
//        let regexCheckResult = self.checkRegexValidity(content: contentText)
//        
//        guard regexCheckResult == true else {
//            print("Warning: TextField Input Regex Check is False, field: \(self.fieldKey)")
//            
//            validateDelegate?.validateInfoDidFinishCheckingValidity(self, withContent: contentText, result:false)
//        
//            completion(false)
//            return
//        }
//        
//        self.checkPrecheckValidity(with: contentText) { (precheckResult) in
//            
//            self.validateDelegate?.validateInfoDidFinishCheckingValidity(self, withContent: contentText, result: precheckResult && regexCheckResult)
//            completion(precheckResult && regexCheckResult)
//        }
//    }
    
    
    
//    func checkPrecheckValidity(with contentText: String?, completion: @escaping (Bool) -> Void) {
//        
//        //如果需入內容為nil, 回傳result = self.nullable
//        guard contentText != nil else{
//            completion(self.nullable)
//            return
//        }
//        
//        //如果沒有額外的檢查邏輯，回傳completion(true)
//        guard let logic = validateDelegate?.validateInfoPrecheckLogic(self, contentText: contentText)
//            else {
//            completion(true)
//            return
//        }
//        
//        logic { (result) in
//            completion(result)
//        }
//
//    }
}
