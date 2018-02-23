//
//  SelectionViewController.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit
import  Kingfisher
class SelectionViewController: ROOTViewController,UITableViewDelegate,UITableViewDataSource,SelectionViewCelldelegate {
    var  dataArr = NSMutableArray()
    let  headView = UIView()
    let  tableView = UITableView()
    
    let urlArray:NSArray = ["x3","x1","x6","x4","x7","x8","x2","x5"]
    let nameArray:NSArray = ["戒指","耳饰","项链","手链","胸针","袖扣","发饰","套系"]
    let imageArray:NSArray = ["sort_ring","sort_earrings","sort_necklace","sort_bracelet","sort_brooch","sort_cuff","sort_hair","sort_set"];
    override func viewDidLoad() {
        super.viewDidLoad()

       
      
        makeTitleUI()
        maketableUI()
        loadtoptree()
        
        
    }
    func maketableUI(){
        tableView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-StatusBarAndNavigationBarHeight()+20)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableHeaderView = self.headView
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.register(SelectionViewCell.self, forCellReuseIdentifier: "Select")
        self.view .addSubview(tableView)
        
        
        
    }
    
    func makeTitleUI(){

        self.headView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 950*hb())
        self.view .addSubview(headView)
        

      let tjLable = UILabel()
        tjLable.frame = CGRect.init(x: 0, y: 121*hb(), width: SCREEN_WIDTH, height: 30*hb())
        tjLable.text = "推荐品牌"
        tjLable.textColor = UIColor.black
        tjLable.textAlignment = .center
        tjLable.font = UIFont.systemFont(ofSize: 16)
        self.headView .addSubview(tjLable)

        let line1 = UIView()
        line1.frame = CGRect.init(x: 345*wb(), y: 161*hb(), width: 56*wb(), height: 0.5)
        line1.backgroundColor = UIColor.black
        self.headView .addSubview(line1)
        
    let zbLable = UILabel()
        zbLable.frame = CGRect.init(x: 0, y: 890*hb(), width: SCREEN_WIDTH, height: 30*hb())
        zbLable.text = "珠宝分类"
        zbLable.textColor = UIColor.black
        zbLable.textAlignment = .center
        zbLable.font = UIFont.systemFont(ofSize: 16)
        self.headView .addSubview(zbLable)
        
        let line2 = UIView()
        line2.frame = CGRect.init(x: 345*wb(), y:930*hb(), width: 56*wb(), height: 0.5)
        line2.backgroundColor = UIColor.black
        self.headView .addSubview(line2)
        
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
            self.headView.addSubview( but)
        }
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 ;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370 * hb()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let   cell = tableView.dequeueReusableCell(withIdentifier: "Select", for: indexPath) as! SelectionViewCell
        cell.selectionStyle = .none
        let name = self.imageArray[indexPath.row * 2] as! String
        cell.setleftData(tag: indexPath.row * 2 , imageName: name)
        cell.delegate = self;
        let name2 = self.imageArray[indexPath.row * 2 + 1] as! String
        
       cell.setrightData(tag: indexPath.row * 2 , imageName: name2)
        return cell
    }
    
    func SelectionViewCelldelegateleft(tag: Int) {
        let vc = SelectiondeltailViewController()
        vc.name = self.nameArray[tag] as? String
        vc.url = self.urlArray[tag] as? String
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func SelectionViewCelldelegateright(tag: Int) {
        let vc = SelectiondeltailViewController()
        vc.name = self.nameArray[tag] as? String
        vc.url = self.urlArray[tag] as? String
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
