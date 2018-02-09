//
//  JewerlyViewController.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//


import UIKit
import  Alamofire
import SwiftyJSON
class JewerlyViewController: ROOTViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("000",SELECTION_ARTICLE_LIST_URL)
   
        getAlamofiredata(Url: SELECTION_ARTICLE_LIST_URL) { (dict) in
            //SwiftyJSON
            let jsonex = JSON(dict)
            print("dict",jsonex);
    
            
        }
        
    }
    

  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

 

}
