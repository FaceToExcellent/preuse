//
//  typearticleModel.swift
//  preuse
//
//  Created by HYZ on 2018/2/23.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class typearticleModel: NSObject {
    var author_avatar :String?
    var author_id :String?
    var author_name :String?
    var cover :String?
    var id_ :String?
    var inputtime :String?
    var pic :String?
    var title :String?
    var type_id :String?
    var type_name :String?
    var wh :String?
    
    func typearticleModelsetData(data:NSDictionary)->typearticleModel{
        let model = typearticleModel()
        
        model.author_avatar = data["author_avatar"] as? String
        model.author_id = data["author_id"] as? String
        model.author_name = data["author_name"] as? String
        model.cover = data["cover"] as? String
        model.id_ = data["id"] as? String
        model.inputtime = data["inputtime"] as? String
        model.pic = data["pic"] as? String
        model.title = data["title"] as? String
        model.type_id = data["type_id"] as? String
        model.type_name = data["type_name"] as? String
        model.wh = data["wh"] as? String
        
        
        return model
        
        
    }
    
    
}
