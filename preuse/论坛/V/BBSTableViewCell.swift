//
//  BBSTableViewCell.swift
//  preuse
//
//  Created by HYZ on 2018/2/24.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit
import Kingfisher
class BBSTableViewCell: UITableViewCell {

    let headimage = UIImageView()
    let name      = UILabel()
    let time      = UILabel()
    let htimage     = UIImageView()
    let numlabel  = UILabel()
    let tztitle   = UILabel()
    
    let imag1 = UIImageView()
    let imag2 = UIImageView()
    let imag3 = UIImageView()
    
    let colorline = UIView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: .none)
        self.makeCellUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func makeCellUI(){
        
        headimage.frame = CGRect.init(x: 26*wb(), y: 28*hb(), width: 65*wb(), height: 65*wb())
        headimage.contentMode = .scaleAspectFill
        headimage.clipsToBounds = true
        headimage.layer.cornerRadius = headimage.frame.width/2
        headimage.layer.masksToBounds = true
        self .addSubview(headimage)
        
        name.frame = CGRect.init(x: 104*wb(), y: 40*hb(), width: 450*wb(), height: 30*hb())
        name.textColor = UIColor.black
        name.textAlignment = .left
        name.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(name)
        
        time.frame = CGRect.init(x: 104*wb(), y: 70*hb(), width: 450*wb(), height: 20*hb())
        time.textColor = UIColor.gray
        time.textAlignment = .left
        time.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(time)
        
        htimage.frame = CGRect.init(x: SCREEN_WIDTH - 130*wb() , y: 50 * hb() , width: 25*wb(), height: 22*hb())
        htimage.image = UIImage.init(named: "postReplyIcon")
        htimage.contentMode = .scaleAspectFill
        htimage.clipsToBounds = true
        self.addSubview(htimage)
        
        numlabel.frame = CGRect.init(x: SCREEN_WIDTH - 100*wb() , y: 50 * hb() , width: 100*wb(), height: 22*hb())
        numlabel.textColor = UIColor.gray
        numlabel.textAlignment = .center
        numlabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(numlabel)
        
        tztitle .frame =  CGRect.init(x: 30*wb() , y: 128 * hb() , width:690*wb(), height: 30*hb())
        tztitle.textColor = UIColor.black
        tztitle.textAlignment = .left
        tztitle.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(tztitle)
        
        
        imag1.frame = CGRect.init(x: 30*wb(), y: 200*hb(), width: 224*wb(), height: 165*wb())
        imag1.contentMode = .scaleAspectFill
        imag1.clipsToBounds = true
        self.addSubview(imag1)
        
        
        imag2.frame = CGRect.init(x: 268*wb(), y: 200*hb(), width: 224*wb(), height: 165*wb())
        imag2.contentMode = .scaleAspectFill
        imag2.clipsToBounds = true
        self.addSubview(imag2)
        
        imag3.frame = CGRect.init(x: 506*wb(), y: 200*hb(), width: 224*wb(), height: 165*wb())
        imag3.contentMode = .scaleAspectFill
        imag3.clipsToBounds = true
        self.addSubview(imag3)
        
        
        colorline .frame = CGRect.init(x: 0, y: self.frame.size.height - 15 * hb(), width: SCREEN_WIDTH, height: 15*hb())
        colorline.backgroundColor = UIColor.init(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        self.addSubview(colorline)
    }
    
    
    
    func setcelldatawithimge(model:BBSModel){
        
        headimage.kf.setImage(with: URL.init(string: model.avatar!))
        name.text = model.author
        time.text = model.dateline
        
        numlabel.text = "\(String(describing: model.replies!)) 回帖"
        tztitle.text  = model.subject
        
        imag1.kf.setImage(with: URL.init(string: model.pics?.firstObject as! String))
        imag2.kf.setImage(with: URL.init(string: model.pics?.object(at: 1) as! String))
        imag3.kf.setImage(with: URL.init(string: model.pics?.lastObject as! String))
          colorline .frame = CGRect.init(x: 0, y: self.frame.size.height - 15 * hb(), width: SCREEN_WIDTH, height: 15*hb())
        
    }
    
    
    func setcelldataWithNOimage(model:BBSModel){
        headimage.kf.setImage(with: URL.init(string: model.avatar!))
        name.text = model.author
        time.text = model.dateline
        
        numlabel.text = "\(String(describing: model.replies!)) 回帖"
        tztitle.text  = model.subject
        
         imag1.frame = CGRect.init(x: 0, y: 0, width: 0, height: 0)
         imag2.frame = CGRect.init(x: 0, y: 0, width: 0, height: 0)
         imag3.frame =  CGRect.init(x: 0, y: 0, width: 0, height: 0)
        
        
         colorline .frame = CGRect.init(x: 0, y: self.frame.size.height - 15 * hb(), width: SCREEN_WIDTH, height: 15*hb())
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
