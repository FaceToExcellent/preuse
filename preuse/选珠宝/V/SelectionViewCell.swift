//
//  SelectionViewCell.swift
//  preuse
//
//  Created by HYZ on 2018/2/23.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class SelectionViewCell: UITableViewCell {

    let leftButton = UIButton()
    let rightButton  = UIButton()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: .none)
        self.makeCellUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func makeCellUI(){
        
        leftButton.frame = CGRect.init(x: 17*wb(), y: 10*hb(), width: 350*wb(), height: 350*hb())
        leftButton.addTarget(self, action: Selector(("leftButtonclick")), for: UIControlEvents.touchUpInside)
        leftButton.imageView?.contentMode = .scaleAspectFill
        leftButton.imageView?.clipsToBounds = true
        self .addSubview(leftButton)
        
        
        rightButton.frame = CGRect.init(x: 17*wb() + 366 * wb(), y: 10*hb(), width: 350*wb(), height: 350*hb())
        rightButton.addTarget(self, action: Selector(("rightButtonCLick")), for: UIControlEvents.touchUpInside)
        rightButton.imageView?.contentMode = .scaleAspectFill
        rightButton.imageView?.clipsToBounds = true
        self .addSubview(rightButton)
    }
    
    
    
    func leftButtonclick(sender:UIButton){
        
    }
    
    func rightButtonCLick(sender:UIButton){
        
    }
    
    
    
    func setleftData(tag:Int,imageName:String){
        leftButton.tag = tag
        leftButton.setBackgroundImage(UIImage.init(named: imageName), for: UIControlState.normal)
    }
    func setrightData(tag:Int,imageName:String){
        rightButton.tag = tag
        rightButton.setBackgroundImage(UIImage.init(named: imageName), for: UIControlState.normal)
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
