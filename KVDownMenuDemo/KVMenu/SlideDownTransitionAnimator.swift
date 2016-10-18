//
//  SlideDownTransitionAnimator.swift
//  bepo
//
//  Created by KevinLiou on 2016/3/29.
//  Copyright © 2016年 bepo. All rights reserved.
//

import UIKit

class SlideDownTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var duration = 0.5
    var isPresenting = false
    
    //MARK: -- UIViewControllerTransitioningDelegate
    //視圖控制器要出現時會回傳動畫物件
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        return self
    }
    
    //視圖控制器解除
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        return self
    }
    
    
    //MARK: - UIViewControllerAnimatedTransitioning
    //動畫秒數
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    //轉換動畫
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //get view
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        //transform
        let container = transitionContext.containerView()
        let offScreenUp = CGAffineTransformMakeTranslation(0, -(container.frame.height))
        let offScreenDown = CGAffineTransformMakeTranslation(0, (container.frame.height))
        
        //讓toView 離開畫面
        if isPresenting {
            toView.transform = offScreenUp
        }
        
        //將兩個視圖加入container view
        container.addSubview(fromView)
        container.addSubview(toView)
        
        //執行動畫
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.TransitionNone, animations: { 
            
            if self.isPresenting{
                
                fromView.transform = offScreenDown
                fromView.alpha = 0.5
                toView.transform = CGAffineTransformIdentity
            }else{
                fromView.transform = offScreenUp
                toView.alpha = 1.0
                toView.transform = CGAffineTransformIdentity
            }
            
            
        }) { (finished) in
            
            transitionContext.completeTransition(true)
            
        }
        
    }
}
