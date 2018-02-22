//
//  ROOTViewController.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//
import UIKit
/**
 判断是不是 iPhoneX
 */
func iPhoneX()->Bool
{
    if UIScreen.main.bounds.width == 375 && UIScreen.main.bounds.height == 812{
        return true
    }else
    {
        return false
    }
}

/**
 屏幕宽度比
 */
func wb() ->CGFloat{
    return  UIScreen.main.bounds.width/750
}

/**
 屏幕高度比
 */
func hb() ->CGFloat{
    if iPhoneX() {
        return UIScreen.main.bounds.height/1624
    }else
    {
        return UIScreen.main.bounds.height/1334
    }
}

/**
 顶部状态栏高度
 */
func StatusBarAndNavigationBarHeight()->CGFloat
{
    if iPhoneX() {
        return 88
    }else
    {
        return 64
    }
}




class ROOTViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

  
        
      
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
