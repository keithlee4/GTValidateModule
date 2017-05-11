//
//  Any+GTValidatePickableData.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/27.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation

extension String : GTValidatePickableData {
    var pickerTitle: String {
        return self
    }
    
    var pickerID: String {
        return self
    }
    
    var pickerSelectContentTitle: String? {
        return self
    }
}

extension NSString : GTValidatePickableData {
    var pickerTitle: String {
        return self as String
    }
    
    var pickerID: String {
        return self as String
    }
    
    var pickerSelectContentTitle: String? {
        return self as String
    }
}
