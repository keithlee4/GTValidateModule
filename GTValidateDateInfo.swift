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
    
    init(_ format:String? = nil, mode:UIDatePickerMode) {
        if let f = format {
            dateFormat = f
        }
        
        datePickerMode = mode
    }
}
