//
//  ContainViewController.swift
//  bepo
//
//  Created by KevinLiou on 2016/4/11.
//  Copyright © 2016年 bepo. All rights reserved.
//

import UIKit

class KVDownMenu: UIViewController {

    var contentViewController:UIViewController?
    var menuViewController:UIViewController = UIViewController()
    let slideDownTransitionAnimator = SlideDownTransitionAnimator()
    private var containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        containerView.frame = self.view.bounds
        self.view.addSubview(containerView)
        
        if let _contentViewController = self.contentViewController {
            self.changeContentViewController(_contentViewController)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func showMenu() {
        menuViewController.transitioningDelegate = slideDownTransitionAnimator
        self.presentViewController(menuViewController, animated: true, completion: nil)
    }
    
    func hideMenu() {
        if ((self.isViewLoaded() == true) && (self.view.window == true)) {
            return
        }else{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func changeContentViewController(contentViewController:UIViewController){
        
        if let _contentViewController = self.contentViewController {
            
            //remove old
            _contentViewController.view.removeFromSuperview()
            _contentViewController.willMoveToParentViewController(nil)
            _contentViewController.removeFromParentViewController()
            
            //add new
            self.contentViewController = contentViewController
            self.contentViewController!.view.frame = self.view.bounds
            self.containerView.addSubview(self.contentViewController!.view)
            self.addChildViewController(self.contentViewController!)
            self.contentViewController?.didMoveToParentViewController(self)
            
        }else{
            self.contentViewController = contentViewController
        }
    }
    
    
    func changeContentViewControllerAndDismissMenu(contentViewController:UIViewController){
        
        
        if let _contentViewController = self.contentViewController {
            
            //remove old
            _contentViewController.view.removeFromSuperview()
            _contentViewController.willMoveToParentViewController(nil)
            _contentViewController.removeFromParentViewController()
            
            
            self.dismissViewControllerAnimated(true) {
                //add new
                self.contentViewController = contentViewController
                self.contentViewController!.view.frame = self.view.bounds
                self.containerView.addSubview(self.contentViewController!.view)
                self.addChildViewController(self.contentViewController!)
                self.contentViewController?.didMoveToParentViewController(self)
                
            }
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
