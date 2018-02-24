//
//  BBSTableViewCell.swift
//  preuse
//
//  Created by HYZ on 2018/2/24.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

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
        
        
        
        
        
    }
    
    
    
    func setcelldatawithimge(){
        
    }
    
    
    func setcelldataWithNOimage(){
        
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
