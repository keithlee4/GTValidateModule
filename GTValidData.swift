//
//  GTValidData.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/11/2.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation

//This struct is used for data passed validation of validateInfo and it's prechecker.
//Main use for constructing API request vars.

//The type of value could be found in the valedableView
struct GTValidData {
    var validateInfo: GTValidateInfo!
    var value: Any?
}
