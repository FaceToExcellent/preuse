//
//  SelectionModel.swift
//  preuse
//
//  Created by HYZ on 2018/2/23.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class SelectionModel: NSObject {
    var id_ :String?
    var name :String?
    var thumb :String?
    var url :String?
    
    func SelectionModelsetdata(data:NSArray)->NSMutableArray{
        let  Marr = NSMutableArray()
        for i in 0 ..< data.count {
            let dic :NSDictionary = data.object(at: i) as! NSDictionary
            let model = SelectionModel()
            model.id_ = dic["id"] as? String
            model.name = dic["name"] as? String
            model.thumb = dic["thumb"] as? String
            model.url = dic["url"] as? String
            
            Marr.add(model)
        }
        
        
        return Marr
    }
}
