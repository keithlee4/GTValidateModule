//
//  GTValidateModuleConstant.swift
//  Sun-iOS
//
//  Created by keith.lee on 2017/5/15.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import Foundation
enum GTValidateModuleConstant: String {
    case pwd = "Password"
    case confirmPassword = "ConfirmPassword"
    case userID = "UserID"
    case email = "Email"
    case recommenderAccount = "RecommenderAccount"
    case settlerAccount = "SettlerAccount"
    case authCode = "AuthCode"
    case legSide = "LegSide"
//    case phoneNationCode = "PhoneNationCode"
//    case phone = "Phone"
//    case oldPassword = "OldPassword"
//    case password = "Password"
//    case country = "Country"
//    case province = "Province"
//    case city = "City"
//    case town = "Town"
//    case zip = "Zip"
//    case address = "Address"

//    case sysID = "SysID"
//
//
//    case system = "System"
//    case identityID = "IdentityID"
//    case fullName = "FullName"
//    case firstName = "FirstName"
//    case lastName = "LastName"
//    case nickName = "NickName"
//    case birthday = "Birthday"
//    case gender = "Gender"
//    case cellNumber = "CellNumber"
//    case detailAddress = "DetailAddress"
//    case officeTel = "OfficeTel"
//    case fax = "Fax"
//    case nation = "Nation"
//    case oldLevel2Password = "OldLevel2Password"
//    case level2Password = "Level2Password"
//    case level2PasswordConfirm = "Level2PasswordConfirm"
//    case authCode = "AuthCode"
    
    var fieldKey : String {
        return rawValue
    }
}
