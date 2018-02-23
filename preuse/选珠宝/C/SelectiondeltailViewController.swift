//
//  SelectiondeltailViewController.swift
//  preuse
//
//  Created by HYZ on 2018/2/23.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit

class SelectiondeltailViewController: UIViewController {

    var url :String? = nil
    var  name :String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
       self.title = name
        
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor(red: 24/255, green: 22/255, blue: 22/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.black]
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
