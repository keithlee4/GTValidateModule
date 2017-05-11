//
//  GTValidatePickableData.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/27.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation

protocol GTValidatePickableData {
    var pickerTitle: String { get }
    var pickerAttrTitle: NSAttributedString { get }
    var pickerID: String { get }
    var pickerSelectContentTitle: String? { get }
    var pickerSelectContentAttrTitle: NSAttributedString { get }
}

extension GTValidatePickableData {
    var pickerAttrTitle: NSAttributedString {
        return NSAttributedString.init(string: pickerTitle)
    }
    
    var pickerSelectContentAttrTitle: NSAttributedString {
        return pickerAttrTitle
    }
}
