//
//  GTValidateInfoFactory.swift
//  wddouble
//
//  Created by Keith Lee on 2016/12/27.
//  Copyright © 2016年 git4u. All rights reserved.
//

import UIKit

struct GTValidateStruct {
    var fieldKey: String
    var name: String
    var placeHolder: String
    var regex: String?
    var keyboard: GTKeyboardType
    var isSecured: Bool
    var isNullable: Bool
}

/// Factory 定義所有會產生的單一validate物件並且封裝為GTValueStorage，並且可以組合為package
//  func 應接受一個default value參數，這個參數的值在預設時不會經過check flow，務必確保正確性。
//  有需要時可以將多個物件封裝在一個method或computed var裡，並且回傳一個tuple

//  當遇到類似卻有部分參數不同的validate logic的時候，建立一個新的func 使用類似的info並且更改對應的值


//  將多個storage封裝的package，每一個package都須自定義一組tuple
//  透過package取得的storages目前無法設定初始值，
//  參數containerType將會全部設定為同一種type

//typealias GTValidableValueStoragePackage = [GTValidableValueStorage]

class GTValueStorageFactory: NSObject {
    //MARK: - PACKAGE
    //MARK: -
    
    static var moduleDefine: GTValidateModuleDefinable = GTValidateModuleDefine()
    static func usingDefine(define: GTValidateModuleDefinable) {
        moduleDefine = define
    }
    //所有的container type在這裡都預設成textfield (最常見）
    static func storage(with validateStruct: GTValidateStruct, defaultValue:String?, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validateInfo = GTValidateInfo.init(validateStruct)
        let valueStorage = GTValidableValueStorage.init(with: validateInfo, value: defaultValue, containerType: containerType)
        
        return valueStorage
    }

    
    //MARK: - STORAGE COMPONENTS
    //MARK: -
    //MARK: 註冊
    
    //MARK: User ID
    static func userID(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validType = GTValidateModuleConstant.userID
        let validStruct = GTValidateStruct.init(
            fieldKey: validType.fieldKey,
            name: moduleDefine.name(for: validType),
            placeHolder: moduleDefine.placeholder(for: validType),
            regex: moduleDefine.regex(for: validType),
            keyboard: GTKeyboardType.basic,
            isSecured: false,
            isNullable: false
        )
        
        return storage(with: validStruct, defaultValue: value, containerType: containerType)
    }
    
    //MARK: Password
    static func pwd(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validType = GTValidateModuleConstant.pwd
        let validStruct = GTValidateStruct.init(
            fieldKey: validType.fieldKey,
            name: moduleDefine.name(for: validType),
            placeHolder: moduleDefine.placeholder(for: validType),
            regex: moduleDefine.regex(for: validType),
            keyboard: GTKeyboardType.basic,
            isSecured: false,
            isNullable: false
        )
        
        return storage(with: validStruct, defaultValue: value, containerType: containerType)
    }
    
    //MARK: Confirm Password
    static func confirmPwd(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validType = GTValidateModuleConstant.confirmPassword
        let validStruct = GTValidateStruct.init(
            fieldKey: validType.fieldKey,
            name: moduleDefine.name(for: validType),
            placeHolder: moduleDefine.placeholder(for: validType),
            regex: moduleDefine.regex(for: validType),
            keyboard: GTKeyboardType.basic,
            isSecured: false,
            isNullable: false
        )
        
        return storage(with: validStruct, defaultValue: value, containerType: containerType)
    }
    
    //MARK: Mail
    static func email(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validType = GTValidateModuleConstant.email
        let validStruct = GTValidateStruct.init(
            fieldKey: validType.fieldKey,
            name: moduleDefine.name(for: validType),
            placeHolder: moduleDefine.placeholder(for: validType),
            regex: moduleDefine.regex(for: validType),
            keyboard: GTKeyboardType.basic,
            isSecured: false,
            isNullable: false
        )
        
        return storage(with: validStruct, defaultValue: value, containerType: containerType)
    }
    
    //MARK: recommender
    static func recommender(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validType = GTValidateModuleConstant.recommenderAccount
        let validStruct = GTValidateStruct.init(
            fieldKey: validType.fieldKey,
            name: moduleDefine.name(for: validType),
            placeHolder: moduleDefine.placeholder(for: validType),
            regex: moduleDefine.regex(for: validType),
            keyboard: GTKeyboardType.basic,
            isSecured: false,
            isNullable: false
        )
        
        return storage(with: validStruct, defaultValue: value, containerType: containerType)
    }
    
    //MARK: settler
    static func settler(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validType = GTValidateModuleConstant.settlerAccount
        let validStruct = GTValidateStruct.init(
            fieldKey: validType.fieldKey,
            name: moduleDefine.name(for: validType),
            placeHolder: moduleDefine.placeholder(for: validType),
            regex: moduleDefine.regex(for: validType),
            keyboard: GTKeyboardType.basic,
            isSecured: false,
            isNullable: false
        )
        
        return storage(with: validStruct, defaultValue: value, containerType: containerType)
    }
    
    //MARK: Auth Code
    static func authCode(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validType = GTValidateModuleConstant.authCode
        let validStruct = GTValidateStruct.init(
            fieldKey: validType.fieldKey,
            name: moduleDefine.name(for: validType),
            placeHolder: moduleDefine.placeholder(for: validType),
            regex: moduleDefine.regex(for: validType),
            keyboard: GTKeyboardType.basic,
            isSecured: false,
            isNullable: false
        )
        
        return storage(with: validStruct, defaultValue: value, containerType: containerType)
    }
}
