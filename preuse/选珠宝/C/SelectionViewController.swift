//
//  SelectionViewController.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit
import  Kingfisher
class SelectionViewController: ROOTViewController {
    var  dataArr = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
//        _urlArray = @[@"x3",@"x1",@"x6",@"x4",@"x7",@"x8",@"x2",@"x5"];
//        _nameArray = @[@"戒指",@"耳饰",@"项链",@"手链",@"胸针",@"袖扣",@"发饰",@"套系"];
//        _imageArray = @[@"sort_ring",@"sort_earrings",@"sort_necklace",@"sort_bracelet",@"sort_brooch",@"sort_cuff",@"sort_hair",@"sort_set"];
        
        loadtoptree()
        
        
    }
    
    func loadtoptree(){
        let  url = ADDRESS_IP(Url: "/jewellery/hotBrands/") as String
        getAlamofiredata(Url: url) { (dict) in
           // print(dict)
            let dic = dict as! NSDictionary
            let arr = dic["data"] as! NSArray
            self.dataArr = SelectionModel().SelectionModelsetdata(data: arr)
            self.settopUI()
           
        }
         
    }
    func settopUI(){
        for i in 0 ..< 3{
            let but = UIButton()
            but.tag = i
            but.frame = CGRect.init(x: 0, y: 191 * hb() + 225 * hb() * CGFloat(i), width: SCREEN_WIDTH, height:  200 * hb())
            
            let model: SelectionModel = self.dataArr.object(at: i) as! SelectionModel
            let url = URL.init(string: model.thumb!)
            but.kf.setImage(with: url, for: .normal)
            
            but.imageView?.contentMode = .scaleAspectFill
            but.imageView?.clipsToBounds = true
            self.view .addSubview( but)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
