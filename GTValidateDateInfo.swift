//
//  GTValidateDateInfo.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/27.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation
import UIKit

struct GTValidateDateInfo {
    var dateFormat: String = "yyyy-MM-dd HH:mm:ss"
    var datePickerMode: UIDatePickerMode = .date
    
    init(_ format:String? = nil, modeName:String) {
        if let f = format {
            dateFormat = f
        }
        
        if let mode = mode(with: modeName){
            datePickerMode = mode
        }
    }
    
    init(_ format:String? = nil, mode:UIDatePickerMode) {
        if let f = format {
            dateFormat = f
        }
        
        datePickerMode = mode
    }
    
    var modeName:String {
        get {
            switch self.datePickerMode {
            case .time:
                return "DatePickerTime"
            case .date:
                return "DatePickerDate"
            case .dateAndTime:
                return "DatePickerDateAndTime"
            case .countDownTimer:
                return "DatePickerCountDownTimer"
            }
        }
    }
    
    func mode(with name:String) -> UIDatePickerMode? {
        switch name {
        case "DatePickerTime":
            return .time
        case "DatePickerDate":
            return .date
        case "DatePickerDateAndTime":
            return .dateAndTime
        case "DatePickerCountDownTimer":
            return  .countDownTimer
        default:
            return nil
        }
    }
}
