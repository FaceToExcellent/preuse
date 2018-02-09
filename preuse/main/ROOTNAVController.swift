//
//  ROOTNAVController.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class ROOTNAVController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        addChildViewControllers()
        
        
        
    }

    fileprivate func  addChildViewControllers(){
        addChildViewController("JewerlyViewController", title: "首页", imageName: "tab1")
        addChildViewController("SelectionViewController", title: "选珠宝", imageName: "tab2")
        addChildViewController("BBSViewController", title: "论坛", imageName: "tab3")
        addChildViewController("MyCenterViewController", title: "我的", imageName: "tab4")
    }
    fileprivate func addChildViewController(_ childControllerName: String, title: String, imageName: String) {
        
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let  vcClass = cls as!UIViewController.Type
        let vc = vcClass.init()
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

}
