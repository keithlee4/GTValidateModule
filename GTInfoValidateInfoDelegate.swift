//
//  GTInfoValidableTextFieldDelegate.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/13.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation

//typealias InfoValidResultHandler = (Bool) -> Void

public protocol GTInfoValidateInfoDelegate {
    
    //validateInfoPrecheckLogic
    //Tell Delegate to give the precheck logic of this info, then return a function with completion handler ((bool) -> Void) parameter.
    func validateInfoPrecheckLogic(_ info:GTValidateInfo, contentText:String?) -> ((@escaping (Bool) -> Void) -> Void)?
    
    //func resultHandlerForValidateInfo(_ info:GTValidateInfo) -> InfoValidResultHandler?
    
    func validateInfoWillStartCheckingValidity(_ info:GTValidateInfo)
    func validateInfoDidFinishCheckingValidity(_ info:GTValidateInfo, withContent content:String?, result:Bool)
}
