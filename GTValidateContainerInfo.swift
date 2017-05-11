//
//  GTValidateContainerInfo.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/28.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation

enum ContainerType {
    case label
    case textField
    case textView
    
    var desc: String {
        switch self {
        case .label:
            return "Label"
        case .textField:
            return "TextField"
        case .textView:
            return "TextView"
        }
    }
    
    static func type(of desc:String) -> ContainerType {
        switch desc {
        case "Label":
            return .label
        case "TextField":
            return .textField
        case "TextView":
            return .textView
        default:
            return .label
        }
    }
}
