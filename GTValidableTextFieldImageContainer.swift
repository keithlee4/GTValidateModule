//
//  GTValidableTextFieldImageContainer.swift
//  Sun-iOS
//
//  Created by Keith Lee on 2017/5/14.
//  Copyright © 2017年 git4u.com. All rights reserved.
//

import UIKit

final class GTValidableTextFieldImageContainer: GTValidableTextFieldContainer {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var sepLine: UIView!
    @IBOutlet weak var errLabel: UILabel!
    
    override func handleError(reason: String) {
        print("Get error: \(reason)")
        errLabel.isHidden = false
        errLabel.text = reason
    }
    
    override func handleSuccess() {
        print("success~~~~")
        errLabel.isHidden = true
    }
    
    override func handleEditingUpdate(isEditing: Bool) {
        sepLine.backgroundColor = isEditing ? UIColor.blue : UIColor.scWarmGreyTwo
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
