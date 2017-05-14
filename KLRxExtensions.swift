//
//  KLRxExtensions.swift
//  Sun-iOS
//
//  Created by Keith Lee on 2017/5/12.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

infix operator <->

func <-> <T>(property: ControlProperty<T>, variable: Variable<T>) -> Disposable {
    let bindToUIDisposable = variable.asObservable().skip(1).debug("Bind UI Control Property")
        .bind(to: property)
    let bindToVariable = property.skip(1).debug("property subscribe")
        .subscribe(onNext: { n in
            variable.value = n
        }, onCompleted:  {
            bindToUIDisposable.dispose()
        })
    
    return CompositeDisposable.init(bindToUIDisposable, bindToVariable)
}
