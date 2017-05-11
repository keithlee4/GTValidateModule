//
//  GTKeyboardType.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/11/1.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation
enum GTKeyboardType {
    case basic
    case number
    case decimal
    case datePicker(GTValidateDateInfo)
    case picker([GTValidatePickableData])
    
    var name: String {
        get {
            switch self {
            case .basic:
                return "Default"
            case .number:
                return "Number"
            case .decimal:
                return "Decimal"
            case .picker(_):
                return "Picker"
            case .datePicker(let info):
                return info.modeName
            }
        }
    }
    
    static func type(with name:String, dateInfo:GTValidateDateInfo? = nil, pickerValues:[GTValidatePickableData]? = nil) -> GTKeyboardType? {
        switch name {
        case GTKeyboardType.basic.name:
            return .basic
        case GTKeyboardType.number.name:
            return .number
        case GTKeyboardType.decimal.name:
            return .decimal
            
        case GTKeyboardType.datePicker(GTValidateDateInfo.init(nil, mode: .time)).name,
             GTKeyboardType.datePicker(GTValidateDateInfo.init(nil, mode: .date)).name,
             GTKeyboardType.datePicker(GTValidateDateInfo.init(nil, mode: .dateAndTime)).name,
             GTKeyboardType.datePicker(GTValidateDateInfo.init(nil, mode: .countDownTimer)).name:
            
            guard let d = dateInfo else {
                print("Warning : trying to use date picker but no date info provided")
                return nil
            }
            
            return .datePicker(d)
            
        case GTKeyboardType.picker([]).name:
            guard let value = pickerValues else {
                return .picker([])
            }
            return .picker(value)
            
        default:
            return nil
        }
    }
}
