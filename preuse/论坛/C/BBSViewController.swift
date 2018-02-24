//
//  BBSViewController.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit
import  MJRefresh 
class BBSViewController: ROOTViewController,UITableViewDelegate,UITableViewDataSource {
var  page:Int = 1;
var total_page:Int = 1;
var dateArray = NSMutableArray()
let tableView = UITableView()
let footer = MJRefreshAutoNormalFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      loadviewUI()
      loadBBSData()
    
    }
    
    func loadBBSData(){
        let url = (BBS_LIST_URL as String) + "/digest/1/" + "page/\(page)"
        //http://japp.xbiao.com/apps/Jewelry/ios-Jewelry-1_5-x86_64-1242_2208/bbs/list/digest/1/page/1
       // print(url)
        getAlamofiredata(Url: url) { (dict) in
          // print(dict)
            let dict:NSDictionary = dict as! NSDictionary
            self.total_page = dict["total_page"] as! Int
            let arr:NSMutableArray = BBSModel().BBSModelsetData(data: dict)
            self.dateArray.addObjects(from: arr as! [Any])
            
            self.tableView.reloadData()
        }
    }

    func loadviewUI(){
        self.tableView.frame = CGRect.init(x: 0, y: 0, width:SCREEN_WIDTH , height: SCREEN_HEIGHT - StatusBarAndNavigationBarHeight()+20)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.view.addSubview(tableView);
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"bbs")
        
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(JewerlyViewController.myrefresh))
        //是否自动加载（默认为true，即表格滑到底部就自动加载） 会造成一次性加载多个
        footer.isAutomaticallyRefresh = false
        //刷新时不显示文字（其它情况下还是有提示文字的）
        footer.isRefreshingTitleHidden = true
        self.tableView.mj_footer = footer
    }
    
    
    @objc func myrefresh(){
       //  print("刷新")
        page = page + 1
        if page > total_page {
            self.tableView.mj_footer.endRefreshingWithNoMoreData()
            return;
        }
       loadBBSData()
      self.tableView.mj_footer.endRefreshing()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //  print(self.dateArray.count)
        return self.dateArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.dateArray.object(at: indexPath.row) as! BBSModel
        if (model.pics?.count)! > 0 {
          return  410 * hb()
        }else
        {
            return  230 * hb()
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let   cell = tableView.dequeueReusableCell(withIdentifier: "bbs", for: indexPath)
        cell.selectionStyle = .none
        let model = self.dateArray.object(at: indexPath.row) as! BBSModel
        cell.textLabel?.text = model.subject
        cell.textLabel?.textColor = UIColor.black
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc  = JewerlyDetailViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.title = "文章详情"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
