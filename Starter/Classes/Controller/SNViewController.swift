
//
//  SNViewController.swift
//  ShowNow
//
//  Created by apple on 2019/6/6.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit


class SNViewController: UIViewController {

    var navigationBar = SNNavigationBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }
    
    
    public func addNavigationBar () {
        navigationBar = SNNavigationBar.init()
        navigationBar.frame = CGRect(x: 0, y: kStatusBarHeight, width: ScreenWidth, height: kNavBarHeight)
        navigationBar.backgroundColor=UIColor.cyan
        self.view.addSubview(navigationBar);
        
        navigationBar.backActionBlock = {
            NSLog("打印出来了")
        }
        
    }
    
    //dismiss&&pop
    public func dismissViewController() {
        self.dismiss(animated: true, completion:nil)
    }
    
    
     public func popViewController() {
        if (self.navigationController != nil) {
            self.navigationController?.popViewController(animated:true);
         }
     }
    
    
    
    //页面标题url相关
     public func sn_url(sn_url: String) -> String {
        return sn_url
     }
    
     public func sn_title(sn_title: String) -> String {
        return sn_title
     }

     public func sn_properties(sn_properties:[String:Any]) -> ([String:Any]){
        return sn_properties;
     }
    
 
}
