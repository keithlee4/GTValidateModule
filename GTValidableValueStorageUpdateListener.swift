//
//  GTValidableValueStorageUpdateListener.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/11/4.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation
public protocol GTValidableValueStorageUpdateListener {
    func storage(storage:GTValidableValueStorage, updateValuefrom fromValue:String?, toValue:String?)
}
