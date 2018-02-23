//
//  JewerlyTableViewCell.swift
//  preuse
//
//  Created by HYZ on 2018/2/22.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit
import Kingfisher
class JewerlyTableViewCell: UITableViewCell {

     var coverImage = UIImageView()
     var celltitle = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: .none)
       self.makeCellUI()
    }
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    
    func makeCellUI(){
        
        self.coverImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 560*hb()))
        self.addSubview(self.coverImage)
        
        
        self.celltitle = UILabel.init(frame: CGRect.init(x: 0, y: 610*hb(), width: SCREEN_WIDTH, height: 30*hb()))
        self.celltitle.textAlignment = .center
        self.celltitle.textColor = UIColor.black
        self.celltitle.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(self.celltitle)
    }
    
    func setcellViews(model:ArticleModel){
     
        if model.type == "articles"{
            let mod: typearticleModel = model.model as! typearticleModel
                    let url = URL(string: (mod.cover)!)
                    self.coverImage.kf.setImage(with: url)
            
                    self.celltitle.text = mod.title!
        }

        
    }
    
}
