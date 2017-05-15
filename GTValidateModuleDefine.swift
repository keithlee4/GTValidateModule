//
//  GTValidateModuleRegexDefine.swift
//  Sun-iOS
//
//  Created by keith.lee on 2017/5/15.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import Foundation

protocol GTValidateModuleDefinable {
    var suffix_name : String { get set }
    var suffix_placeholder : String { get set }
    
    func name(for moduleC: GTValidateModuleConstant) -> String
    func placeholder(for moduleC: GTValidateModuleConstant) -> String
    func regex(for moduleC: GTValidateModuleConstant) -> String?
}

class GTValidateModuleDefine: GTValidateModuleDefinable {
    var suffix_name = "Name"
    var suffix_placeholder = "Placeholder"

    
    func name(for moduleC: GTValidateModuleConstant) -> String {
        return moduleC.rawValue + "_" + suffix_name
    }
    func placeholder(for moduleC: GTValidateModuleConstant) -> String {
        return moduleC.rawValue + "_" + suffix_placeholder
    }
    
    func regex(for moduleC: GTValidateModuleConstant) -> String? {
        return nil
    }
}
