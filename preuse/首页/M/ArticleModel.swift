//
//  ArticleModel.swift
//  preuse
//
//  Created by HYZ on 2018/2/22.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class ArticleModel: NSObject {
    var  type_name :String?
    var   title :String?
    var inputtime :String?
    var id_ :String?
    var cover: String?
    func setmyArticleModelData(data:NSDictionary)->NSMutableArray{
        
        let array = data["list"] as? NSArray
        let arr2 = NSMutableArray()
        for i in 0 ..< array!.count{
            let model = ArticleModel()
            
            let dict = (array?.object(at: i) as! NSDictionary)
            model.type_name = dict["type_name"] as?String
            model.title = dict["title"] as?String
            model.inputtime = dict["inputtime"] as?String
            model.id_ = dict["id"] as?String
            model.cover = dict["cover"] as?String
          
            
            
            
            arr2.add(model)
        }
        
        return arr2
    }
}
