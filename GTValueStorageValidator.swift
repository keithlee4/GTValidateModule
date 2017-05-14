//
//  GTValueStorageValidator.swift
//  Sun-iOS
//
//  Created by Keith Lee on 2017/5/13.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import Foundation
import RxSwift

final class GTValueStorageValidator {
    static var verifyLib: KLRxVerifyLibInterface?
    
    enum Logic {
        case isEqual(storages: [GTValidableValueStorage])
        case verify(storage: GTValidableValueStorage)
    }
    
    
    enum ValidatorError: Swift.Error {
        case noLib
        case unequal(from: [GTValidableValueStorage])
        
        //LOC:
        var desc: String {
            switch self {
            case .noLib:
                return "No Lib".localized
            case .unequal(from: let storages):
                let storagesName = storages.reduce("", { (names, storage) -> String in
                    return names + " " + storage.validateInfo.name
                })
                
                return storagesName + " is Not Same".localized
            }
        }
    }
    
    static func check(logic: Logic) -> Observable<GTValidableValueStorage.ContentValidityResult> {
        switch logic {
        case .isEqual(storages: let storages):
            return checkEqual(from: storages)
        case .verify(storage: let storage):
            return verify(from: storage)
        }
    }
    
    fileprivate static func checkEqual(from storages: [GTValidableValueStorage]) -> Observable<GTValidableValueStorage.ContentValidityResult> {
        
        var value: String?
        for storage in storages {
            if let v = value {
                if v != storage.valueVar.value {
                    let result = ValidatorError.unequal(from: storages)
                    return Observable.just(GTValidableValueStorage.ContentValidityResult.invalid(reason: result.desc))
                }
            }
            
            value = storage.valueVar.value
        }
        
        return Observable.just(GTValidableValueStorage.ContentValidityResult.valid)
    }
    
    
    fileprivate static func verify(from storage: GTValidableValueStorage) -> Observable<GTValidableValueStorage.ContentValidityResult> {
        guard let lib = verifyLib else {
            warning("No lib while verify storage, this should not happened")
            return Observable.just(GTValidableValueStorage.ContentValidityResult.invalid(reason: "No Lib"))
        }
        
        return lib.verify(storage:storage)
        
    }
}
