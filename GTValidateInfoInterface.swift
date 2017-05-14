//
//  GTValidateInfoInterface.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/11.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation


protocol GTValidateInfoInterface {
    var name: String! { get set }
    var placeholderText: String! { get set }
    var regex: String? { get set }
    var keyboardType: GTKeyboardType! { get set }
    
//    var validateDelegate: GTInfoValidateInfoDelegate? { get set }
    
    //Field Key: Use this value to define what kind of validate info it is.
    var fieldKey: String! { get set }
    var secured: Bool! { get set }
    
    //Containe, determine what type of view should be generated
//    var containerInfo: GTValidateContainerInfo! { get set }
}
