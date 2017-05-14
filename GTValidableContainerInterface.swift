//
//  GTValidableContainerInterface.swift
//  Sun-iOS
//
//  Created by Keith Lee on 2017/5/14.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import Foundation
import RxSwift

protocol GTValidableContainerInterface: NSObjectProtocol {
    associatedtype V
    
    var disposeBag: DisposeBag { get set }
    var validableView: V! { get set }
    func bind(to view: V)
    func config(storage: GTValidableValueStorage)
    
    func handleError(reason: String)
    func handleSuccess()
}
