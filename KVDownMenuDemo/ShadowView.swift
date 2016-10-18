//
//  ShadowView.swift
//  KVDownMenuDemo
//
//  Created by ctitv on 2016/10/18.
//  Copyright © 2016年 test. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {

    override func drawRect(rect: CGRect) {
        self.layer.borderColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).CGColor
        self.layer.borderWidth = 0.1
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0); //陰影方向
    }

}
