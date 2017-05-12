//
//  GTValidableViewInterface.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/28.
//  Copyright © 2016年 git4u. All rights reserved.
//

import Foundation
import UIKit

public protocol GTValidableViewInterface: NSObjectProtocol {
    
    var valueStorage: GTValidableValueStorage! { get set }
    
    var contentText: String? { get }
    
    func configure(with valueStorage:GTValidableValueStorage,
                   delegateTarget: GTInfoValidateInfoDelegate?,
                   updateListener: GTValidableValueStorageUpdateListener?)
    
    func reload()
    func clearView()
    
//    var errorBGColor: UIColor { get }
//    var successBGColor: UIColor { get }
    
    func handleError(err: Error?)
    func handleSuccess()
    
    //Var to use when input view is not keyboard type.
    var datePicker: UIDatePicker? { get set }
    var dataPicker: UIPickerView? { get set }
}
