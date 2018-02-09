//
//  AFNTool.swift
//  preuse
//
//  Created by HYZ on 2018/2/8.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class AFNTool: NSObject {

    
    
}

func getAlamofiredata(Url:String,complated:@escaping (_ dict: Any) -> ()){
    objchelper.checkPublicKeyCookie()
    Alamofire.request(Url).responseJSON { response in
        
        let str:String =    objchelper.datatoStringUTF8(response.data as Data!)
        
        let json = objchelper.decrypt(str)
        
        let dictdata = objchelper.string(toData: json)
        
        let  dict:Dictionary  = objchelper.jsontoDict(dictdata)
        
        complated(dict)
        
        
    }
}

func postAlamofiredata(Url:String,parameters:NSDictionary,images:NSMutableArray,imageKey:String,complated:@escaping (_ dict: Any) -> ()){
     objchelper.checkPublicKeyCookie()
  
    
   
        
        
     
}

