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
}
