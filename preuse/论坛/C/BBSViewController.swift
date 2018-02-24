//
//  BBSViewController.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class BBSViewController: ROOTViewController {
var  page:Int = 1;
    override func viewDidLoad() {
        super.viewDidLoad()

      loadBBSData()
    }
    
    func loadBBSData(){
        let url = (BBS_LIST_URL as String) + "/digest/1/" + "page/\(page)"
        //http://japp.xbiao.com/apps/Jewelry/ios-Jewelry-1_5-x86_64-1242_2208/bbs/list/digest/1/page/1
        //http://japp.xbiao.com/apps/Jewelry/ios-Jewelry-1_5-x86_64-1242_2208/bbs/list/digest/1/
        //http://japp.xbiao.com/apps/Jewelry/ios-Jewelry-1_5-x86_64-1242_2208/bbs/list/digest/1/page/1
       // print(url)
        getAlamofiredata(Url: url) { (dict) in
           // print(dict)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
