//
//  typeproductModel.swift
//  preuse
//
//  Created by HYZ on 2018/2/23.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class typeproductModel: NSObject {
        var id_ :String?
        var thumb :String?
        var title :String?
    
    func typeproductModelsetdata(data:NSArray)->NSMutableArray{
        let  arr = NSMutableArray()
        
        for i in 0 ..< data.count {
            
            let dic:NSDictionary = data.object(at: i) as! NSDictionary
            let model = typeproductModel()
            model.id_ = dic["id"] as? String
            model.thumb = dic["thumb"] as? String
            model.title = dic["title"] as? String
            
            arr.add(model)
        }
        
        
        return arr
    }
    
}
