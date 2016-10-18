//
//  UIViewController_KVDownMenu.swift
//  bepo
//
//  Created by KevinLiou on 2016/4/11.
//  Copyright © 2016年 bepo. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var sideMenuViewController: KVDownMenu? {
        
        var iter = self.presentingViewController
        while (iter != nil) {
            if ((iter?.isKindOfClass(KVDownMenu)) == true) {
                return iter as? KVDownMenu
            }else if ((iter?.presentingViewController != nil) && (iter?.presentingViewController != iter)){
                iter = iter?.presentingViewController
            }else{
                iter = nil
            }
        }
        
        if iter == nil{
            var iter = self.parentViewController
            while (iter != nil) {
                if ((iter?.isKindOfClass(KVDownMenu)) == true) {
                    return iter as? KVDownMenu
                }else if ((iter?.parentViewController != nil) && (iter?.parentViewController != iter)){
                    iter = iter?.parentViewController
                }else{
                    iter = nil
                }
            }
        }
        
        return nil
    }
    
}
