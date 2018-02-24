//
//  BBSModel.swift
//  preuse
//
//  Created by HYZ on 2018/2/24.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit
/*  data =     {
 attachment = 2;
 author = "\U5317\U4eac\U7684\U973e";
 authorid = 2182964;
 avatar = "http://home.xbiao.com/images/photo/7_80_80.jpg";
 dateline = "2017-10-26 14:43";
 digest = 1;
 message = "\U65bd\U534e\U6d1b\U4e16\U5947\U767d\U5f69\U51b0\U6761\U8033\U5760\Uff0c\U6211\U559c\U6b22\U53eb\U5b83\U51b0\U68cd\U8033\U5760\Uff0c\U662f\U5f69\U767d\U8272\U7684\Uff0c\U5728\U6df1\U8272\U7684\U80cc\U666f\U663e\U9ec4\U8272\Uff0c\U6d45\U8272\U7684\U80cc\U666f\U663e\U84dd\U8272...";
 pics =         (
 "http://bbsimg.xbiao.com/iphone/forum/201710/26/144255t3e4do13e399nnop.jpg",
 "http://bbsimg.xbiao.com/iphone/forum/201710/26/144256a24jjjr7r2jpkpbx.jpg",
 "http://bbsimg.xbiao.com/iphone/forum/201710/26/144257ec8c0f87dwwqc7f3.jpg"
 );
 replies = 2;
 subject = "\U771f\U4eba\U79c0\U65bd\U534e\U6d1b\U4e16\U5947\U767d\U5f69\U51b0\U6761\U8033\U5760";
 tid = 582545;
 views = 178;
 xid = 2174834;
 };
 type = thread;
 }*/
class BBSModel: NSObject {

    var attachment :String?
    var author :String?
    var authorid :String?
    var avatar :String?
    var dateline :String?
    var digest :String?
    var message :String?
  
    var replies :String?
    var subject :String?
    var tid :String?
    var views :String?
    var xid :String?
    
      var pics :NSArray?
    
    var type :String?
  
    func BBSModelsetData(data:NSDictionary)->NSMutableArray{
        let arr = NSMutableArray()
        //print(data)
        let listArr = data["list"] as! NSArray
        for i in 0 ..< listArr.count{
           let model = BBSModel()
           let dict = listArr.object(at: i) as! NSDictionary
            model.type = dict["type"] as? String
            let dic = dict["data"] as!NSDictionary
            
             model.attachment = dic["attachment"] as? String
             model.author = dic["author"] as? String
             model.authorid = dic["authorid"] as? String
             model.avatar = dic["avatar"] as? String
             model.dateline = dic["dateline"] as? String
             model.digest = dic["digest"] as? String
             model.message = dic["message"] as? String
             model.replies = dic["replies"] as? String
             model.subject = dic["subject"] as? String
             model.tid = dic["tid"] as? String
             model.views = dic["views"] as? String
             model.xid = dic["xid"] as? String
             model.pics = dic["pics"] as? NSArray
            
            
            
            arr.add(model)
        }
      
        
        
        
        
        
        return arr
    }
    
}
