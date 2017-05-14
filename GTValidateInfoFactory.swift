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
    
    
//    //MARK: 修改密碼 + 二級驗證
//    typealias GTEditPasswordPackage = (oldPW: GTValidableValueStorage, lv2PW: GTValidableValueStorage, createNewPWPack: CreateNewPasswordPackage)
//    
//    static func editPasswordPack(containerType: ContainerType = .textField) -> GTEditPasswordPackage {
//        return (
//            oldPW: oldPassword(containerType:containerType),
//            lv2PW: lv2Password(containerType:containerType),
//            createNewPWPack: createNewPasswordPack(containerType: containerType)
//        )
//    }
//    
//    //MARK: 修改二級密碼
//    typealias GTEditLv2PwPack = (oldLv2PW: GTValidableValueStorage, lv2PW: GTValidableValueStorage, lv2PWConfirm: GTValidableValueStorage)
//    
//    static func editLv2PwPack(containerType: ContainerType = .textField) -> GTEditLv2PwPack {
//        return (
//            oldLv2PW: oldLv2Password(containerType: containerType),
//            lv2PW: lv2Password(containerType: containerType),
//            lv2PWConfirm: lv2PasswordConfirm(containerType: containerType)
//        )
//    }
//    
//    //MARK: 重置二級密碼
//    typealias GTResetLv2PWPack = (authCode: GTValidableValueStorage, lv2PW: GTValidableValueStorage, lv2PWConfirm: GTValidableValueStorage)
//    
//    static func resetLv2PWPack(containerType: ContainerType = .textField) -> GTResetLv2PWPack {
//        return (
//            authCode: authCode(containerType: containerType),
//            lv2PW: lv2Password(containerType: containerType),
//            lv2PWConfirm: lv2PasswordConfirm(containerType: containerType)
//        )
//    }
//    
//    //MARK: 新增密碼
//    typealias CreateNewPasswordPackage = (pw: GTValidableValueStorage, pwConfirm: GTValidableValueStorage)
//    
//    static func createNewPasswordPack(containerType: ContainerType = .textField) -> CreateNewPasswordPackage {
//        return (
//            pw: password(containerType: containerType),
//            pwConfirm: passwordConfirm(containerType: containerType)
//        )
//    }
//    
//    //MARK: 安置推薦人
//    typealias GTRecommenderAndSettlerPackage = (rec: GTValidableValueStorage, set: GTValidableValueStorage)
//    
//    static func recommenderAndSettlerPack(containerType: ContainerType = .textField) -> GTRecommenderAndSettlerPackage {
//        return (
//            rec: recommender(containerType: containerType),
//            set: settler(containerType: containerType)
//        )
//    }
//    
//    //MARK: 銀行帳號
//    typealias GTBankAccountPackage = (nation:GTValidableValueStorage, bankName: GTValidableValueStorage, bankBranch: GTValidableValueStorage, bankAccount: GTValidableValueStorage, accountHolder: GTValidableValueStorage, swiftCode: GTValidableValueStorage)
//    
//    static func bankAccountPack(containerType: ContainerType = .textField) -> GTBankAccountPackage {
//        return (
//            nation: nation(containerType: containerType),
//            bankName: bankName(containerType: containerType),
//            bankBranch: bankBranch(containerType: containerType),
//            bankAccount: bankAccount(containerType: containerType),
//            accountHolder: bankAccountHolder(containerType: containerType),
//            swiftCode: swiftCode(containerType: containerType)
//        )
//    }
//    
//    //MARK: 發送重消積分
//    typealias GTSendRPPointsPackage = (commerceCollegeAccount: GTValidableValueStorage, email: GTValidableValueStorage, rpSentAmt: GTValidableValueStorage, tag: GTValidableValueStorage)
//    
//    static func sendRPPointsPack(containerType: ContainerType = .textField) -> GTSendRPPointsPackage {
//        return (
//            commerceCollegeAccount(containerType: containerType),
//            email(containerType: containerType),
//            rpSentAmt(containerType: containerType),
//            tag(containerType: containerType)
//        )
//    }
//    
//    //MARK:  private
//    
    //所有的container type在這裡都預設成textfield (最常見）
    fileprivate static func storage(with validateStruct: GTValidateStruct, defaultValue:String?, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validateInfo = GTValidateInfo.init(validateStruct)
        let valueStorage = GTValidableValueStorage.init(with: validateInfo, value: defaultValue, containerType: containerType)
        
        return valueStorage
    }
//
//    
//    //MARK: - STORAGE COMPONENTS
//    //MARK: -
//    //MARK: 註冊
//    
//    //MARK: User ID
    static func userID(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
        let validStruct = GTValidateStruct.init(
            fieldKey: kGTValidateInfoFieldKeyUserID,
            name: "帳號",
            placeHolder: "帳號",
            regex: nil,
            keyboard: GTKeyboardType.basic,
            isSecured: false,
            isNullable: false
        )
        
        return storage(with: validStruct, defaultValue: value, containerType: containerType)
    }
//
//    //MARK: System
//    static func system(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeySystem,
//            name: LocalizationSource.reg_systems.localized,
//            placeHolder: LocalizationSource.g_please_choose.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.picker([]),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
    
}
