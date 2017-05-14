//
//  GTValidableTextFieldContainer.swift
//  Sun-iOS
//
//  Created by Keith Lee on 2017/5/14.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GTValidableTextFieldContainer: UIView, GTValidableContainerInterface {

    typealias V = GTInfoValidableTextField
    
    var disposeBag: DisposeBag = DisposeBag.init()
    @IBOutlet weak var validableView: GTInfoValidableTextField!
    
    func handleSuccess() {
        print("warning: handleSuccess() call on GTValidableTextFieldContainer, you must override it in subclass.")
    }
    
    func handleError(reason: String) {
        print("warning: handleError(reason) call on GTValidableTextFieldContainer, you must override it in subclass.")
    }
    
    func handleEditingUpdate(isEditing: Bool) {
        print("warning: handleEditingUpdate(isEditing: Bool) call on GTValidableTextFieldContainer, you must override it in subclass.")
    }

    func config(storage: GTValidableValueStorage) {
        validableView.configure(with: storage)
        bind(to: validableView)
        observeEditingBehaviors()
    }
    
    internal func bind(to view: GTInfoValidableTextField) {
        validableView = view
        view.valueStorage.validResultVar
            .asObservable()
            .skip(1)
            .debug("bind valid result to value var")
            .subscribe(onNext: {[weak self] result in
                switch result {
                case .valid:
                    self?.handleSuccess()
                case .invalid(reason: let reason):
                    self?.handleError(reason: reason)
                }
                
            }).addDisposableTo(disposeBag)
    }
    
    private func observeEditingBehaviors() {
        validableView.rx.controlEvent(UIControlEvents.editingDidBegin)
            .subscribe(onNext: { [weak self] in
                self?.handleEditingUpdate(isEditing: true)
            }).addDisposableTo(disposeBag)
        
        validableView.rx.controlEvent(UIControlEvents.editingDidEnd)
            .subscribe(onNext: { [weak self] in
                self?.handleEditingUpdate(isEditing: false)
            }).addDisposableTo(disposeBag)
        
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
