//
//  KLRxVerifyLibInterface.swift
//  Sun-iOS
//
//  Created by Keith Lee on 2017/5/13.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import Foundation
import RxSwift

//This might only support verify case, not equality
protocol KLRxVerifyLibInterface {
    func verify(storage: GTValidableValueStorage) -> Observable<GTValidableValueStorage.ContentValidityResult>
}
