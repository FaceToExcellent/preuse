//
//  JewerlyViewController.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//


import UIKit
import  Alamofire
import SwiftyJSON
import  MJRefresh 
class JewerlyViewController: ROOTViewController,UITableViewDelegate,UITableViewDataSource {
var dateArray = NSMutableArray()
let tableView = UITableView()
var  page:Int = 1;
let footer = MJRefreshAutoNormalFooter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  print("首页文章地址：",SELECTION_ARTICLE_LIST_URL)
        //MARK:书写页面
        makeUI()
        //MARK:下载数据
      loadArticleData()
     
    }
    
    func makeUI(){
        self.tableView.frame = CGRect.init(x: 0, y: 0, width:SCREEN_WIDTH , height: SCREEN_HEIGHT - StatusBarAndNavigationBarHeight()+20)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.view.addSubview(tableView);
        tableView.register(UITableViewCell().classForCoder, forCellReuseIdentifier:"article")
        
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(JewerlyViewController.myrefresh))
        //是否自动加载（默认为true，即表格滑到底部就自动加载）
       // footer.isAutomaticallyRefresh = false
        //刷新时不显示文字（其它情况下还是有提示文字的）
        footer.isRefreshingTitleHidden = true
        self.tableView.mj_footer = footer
      
    }
    @objc func myrefresh(){
       // print("刷新")
        page = page + 1
      
        loadArticleData()
        self.tableView.mj_footer.endRefreshing()
    }
    func loadArticleData(){
        let reUrl = SELECTION_ARTICLE_LIST_URL + "/page/\(page)"
         //print(page)
        getAlamofiredata(Url: reUrl) { (dict) in
            //SwiftyJSON
            //            let jsonex = JSON(dict)
            //            let mydict  = jsonex as? NSDictionary
            //print(dict)
            //手动解析
            let mydict:NSDictionary = dict as! NSDictionary
            let Mdict = ArticleModel().setmyArticleModelData(data:mydict)
            self.dateArray.addObjects(from: Mdict as! [Any])
           // print(self.dateArray.count)
            
            self.tableView.reloadData()
         
        }
    }
  
    //MARK:UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  print(self.dateArray.count)
        return self.dateArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500 * hb()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: "article", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.textColor = UIColor.black
        let model:ArticleModel  = dateArray.object(at: indexPath.row) as! ArticleModel
        cell.textLabel?.text  = model.title
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

 

}
