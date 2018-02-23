//
//  ArticleModel.swift
//  preuse
//
//  Created by HYZ on 2018/2/22.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class ArticleModel: NSObject {
    
    var type:String?
    var model:Any?
    var  productsAraray: NSMutableArray?
    //images  articles  products ad 
    func setmyArticleModelData(data:NSDictionary)->NSMutableArray{
        let arrlist = NSMutableArray()
      //  print("setmyArticleModelData",data["list"]!)
        var listArr = NSArray()
        listArr = (data["list"] as? NSArray)!
        for i in 0 ..< listArr.count {
            let model = ArticleModel()
            let dict:NSDictionary = listArr.object(at: i) as! NSDictionary
            let type:String = dict["type"] as! String
            if type == "articles"{
                model.type = "articles"
                let dic  = dict["data"] as! NSDictionary
                model.model =  typearticleModel().typearticleModelsetData(data: dic)
                
                arrlist.add(model)
                
            }
            if type == "images"{
                model.type = "images"
                 let arr  = dict["data"] as! NSArray
                model.model = typeimagesModel().typeimagesModelsetdata(data: arr)
                 arrlist.add(model)
                
            }
            if type == "products"{
                 model.type = "products"
                let arr  = dict["data"] as! NSArray
                model.model = typeproductModel().typeproductModelsetdata(data: arr)
                 arrlist.add(model)
                
            }
            if type == "ad"{
                 model.type = "ad"
                //暂时没有
                 arrlist.add(model)
            }
            
        }
        
        
        
      return arrlist
    }
}
