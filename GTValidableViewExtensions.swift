//
//  GTValidableViewExtensions.swift
//  Sun-iOS
//
//  Created by Keith Lee on 2017/5/15.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import UIKit

class GTValidableBaseContainer: UIView {
    func contain<T: GTValidableContainerInterface>(containView: T){
        if let view = containView as? UIView {
            view.frame = bounds
            addSubview(view)
        }else {
            print("Warning: Trying to contain non-uiview class to contain base view")
        }
    }
}
