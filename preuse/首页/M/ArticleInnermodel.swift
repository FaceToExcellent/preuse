//
//  ArticleInnermodel.swift
//  preuse
//
//  Created by HYZ on 2018/2/22.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class ArticleInnermodel: NSObject {
    var id_ :String?
    var thumb :String?
    var title :String?
    
    func ArticleInnermodelsetdata(data:NSDictionary)->ArticleInnermodel{
        let model = ArticleInnermodel()
         model.id_ = data["id"] as?String
         model.thumb = data["thumb"] as?String
         model.title = data["title"] as?String
        
        
        return model
    }
}
