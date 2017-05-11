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
//    //所有的container type在這裡都預設成textfield (最常見）
//    fileprivate static func storage(with validateStruct: GTValidateStruct, defaultValue:String?, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        let validateInfo = GTValidateInfo.init(validateStruct)
//        let valueStorage = GTValidableValueStorage.init(with: validateInfo, value: defaultValue, containerType: containerType)
//        
//        return valueStorage
//    }
//    
//    
//    //MARK: - STORAGE COMPONENTS
//    //MARK: -
//    //MARK: 註冊
//    
//    //MARK: User ID
//    static func userID(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyUserID,
//            name: LocalizationSource.main_user_name.localized,
//            placeHolder: LocalizationSource.main_user_name.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
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
//    
//    //MARK: Email
//    static func email(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyEmail,
//            name: LocalizationSource.main_email.localized,
//            placeHolder: LocalizationSource.main_email.localized,
//            regex: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}$",
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: Phone Nation Code
//    static func phoneNationCode(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyPhoneNationCode,
//            name: LocalizationSource.reg_countryCode.localized,
//            placeHolder: LocalizationSource.reg_countryCode.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: Phone Number
//    static func phoneNumber(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyPhone,
//            name: LocalizationSource.main_mobile.localized,
//            placeHolder: LocalizationSource.main_mobile.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: Nation
//    static func nation(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyNation,
//            name: LocalizationSource.reg_nations.localized,
//            placeHolder: LocalizationSource.g_please_choose.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.picker([]),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: Full Name
//    static func fullName(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyFullName,
//            name: LocalizationSource.register_name.localized,
//            placeHolder: LocalizationSource.register_name.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: First Name
//    static func firstName(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyFirstName,
//            name: LocalizationSource.register_p_first_name.localized,
//            placeHolder: LocalizationSource.register_p_first_name.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    //MARK: Last Name
//    static func lastName(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyLastName,
//            name: LocalizationSource.register_p_last_name.localized,
//            placeHolder: LocalizationSource.register_p_last_name.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    
//    
//    //MARK: Birthday
//    static func birthDay(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        let dateFormat = GTValidateDateInfo.init("yyyy/MM/dd", mode: .date)
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyBirthday,
//            name: LocalizationSource.main_birth.localized,
//            placeHolder: LocalizationSource.g_please_choose.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.datePicker(dateFormat),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: Password-Related
//    static func oldPassword(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyOldPassword,
//            name: LocalizationSource.changepwd_old_pwd.localized,
//            placeHolder: LocalizationSource.changepwd_p_old_pwd.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: true,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    
//    static func password(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyPassword,
//            name: LocalizationSource.register_pwd.localized,
//            placeHolder: LocalizationSource.register_p_pwd.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: true,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    static func passwordConfirm(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyConfirmPassword,
//            name: LocalizationSource.register_confirm_pwd.localized,
//            placeHolder: LocalizationSource.register_p_confirm_pwd.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: true,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    //MARK: 二級密碼
//    static func lv2Password(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyLevel2Password,
//            name: LocalizationSource.lv2_pwd.localized,
//            placeHolder: LocalizationSource.lv2_p_pwd.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: true,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    static func oldLv2Password(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyOldLevel2Password,
//            name: LocalizationSource.changelv2pwd_old_lv2_pwd.localized,
//            placeHolder: LocalizationSource.changelv2pwd_p_old_lv2_pwd.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: true,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    static func lv2PasswordConfirm(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyLevel2PasswordConfirm,
//            name: LocalizationSource.resetlv2pwd_confirm_lv2_pwd.localized,
//            placeHolder: LocalizationSource.resetlv2pwd_p_confirm_lv2_pwd.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: true,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 驗證碼
//    static func authCode(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyAuthCode,
//            name: LocalizationSource.verifycode.localized,
//            placeHolder: LocalizationSource.verifycode_p.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 安置推薦人
//    static func recommender(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyRecommenderAccount,
//            name: LocalizationSource.register_recommend_name.localized,
//            placeHolder: LocalizationSource.register_p_recommend_name.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    static func settler(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeySettlerAccount,
//            name: LocalizationSource.register_configuration_name.localized,
//            placeHolder: LocalizationSource.register_p_configuration_name.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 公民身份別
//    static func citizenRole(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyCitizenRole,
//            name: LocalizationSource.main_citizen_type.localized,
//            placeHolder: LocalizationSource.g_please_choose.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.picker(GTCitizenRole.list),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    
//    //MARK: 銀行帳號
//    
//    static func bankAccountHolder(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyBankAccountHolder,
//            name: LocalizationSource.bankaccount_user_name.localized,
//            placeHolder: LocalizationSource.bankaccount_p_user_name.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    static func bankName(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyNameOfBank,
//            name: LocalizationSource.bankaccount_bank.localized,
//            placeHolder: LocalizationSource.bankaccount_p_bank.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.picker([]),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    static func bankBranch(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyBankBranch,
//            name: LocalizationSource.bankaccount_bank_branch.localized,
//            placeHolder: LocalizationSource.bankaccount_p_bank_branch.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    static func bankAccount(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyBankAccountName,
//            name: LocalizationSource.bankaccount_bank_account.localized,
//            placeHolder: LocalizationSource.bankaccount_p_bank_account.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    static func swiftCode(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeySwiftCode,
//            name: "Swift Code".localized,
//            placeHolder: "Swift Code".localized,
//            regex: nil,
//            keyboard: GTKeyboardType.number,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    //MARK: 商學院帳號
//    static func commerceCollegeAccount(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyCommerceCollegeAccount,
//            name: "商學院帳號".localized,
//            placeHolder: "商學院帳號".localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 發送數量
//    static func rpSentAmt(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyRPSentAmt,
//            name: "發送數量".localized,
//            placeHolder: "發送數量".localized,
//            regex: nil,
//            keyboard: GTKeyboardType.decimal,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//
//    //MARK: 標籤
//    static func tag(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyTag,
//            name: LocalizationSource.g_tag.localized,
//            placeHolder: LocalizationSource.g_tag.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: true
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 付款平台
//    static func paymentPlatform(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyPaymentPlatform,
//            name: LocalizationSource.buy_choose_platform.localized,
//            placeHolder: LocalizationSource.buy_choose_platform.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.picker(PaymentPlatform.list),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 付款方式
//    static func paymentWay(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyPaymentWay,
//            name: LocalizationSource.buy_choose_payment_type.localized,
//            placeHolder: LocalizationSource.buy_choose_payment_type.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.picker([]),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 身分證
//    static func identityNumber(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyIdentityID,
//            name: LocalizationSource.register_id_number.localized,
//            placeHolder: LocalizationSource.register_p_id_number.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 縣市
//    static func city(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyCity,
//            name: LocalizationSource.address_city.localized,
//            placeHolder: LocalizationSource.address_p_city.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.picker([]),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 鄉鎮區
//    static func town(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyTown,
//            name: LocalizationSource.address_area.localized,
//            placeHolder: LocalizationSource.address_p_area.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.picker([]),
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 郵遞區號
//    static func zip(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyZip,
//            name: LocalizationSource.address_zip_code.localized,
//            placeHolder: LocalizationSource.address_p_zip_code.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.number,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
//    
//    //MARK: 地址
//    static func address(defaultValue value: String? = nil, containerType: ContainerType = .textField) -> GTValidableValueStorage {
//        
//        let validStruct = GTValidateStruct.init(
//            fieldKey: kGTValidateInfoFieldKeyAddress,
//            name: LocalizationSource.address_address.localized,
//            placeHolder: LocalizationSource.address_p_address.localized,
//            regex: nil,
//            keyboard: GTKeyboardType.basic,
//            isSecured: false,
//            isNullable: false
//        )
//        
//        return storage(with: validStruct, defaultValue: value, containerType: containerType)
//    }
    
}
