//
//  NUWebKitViewController.swift
//  news url
//
//  Created by dor ditchi on 22/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit
import WebKit


class NUWebKitViewController: UIViewController{

    var urlToLoad:String!
    @IBOutlet weak var webKit: WKWebView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: urlToLoad)
        let myRequest = URLRequest(url: myURL!)
        webKit.load(myRequest)
        // Do any additional setup after loading the view.
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
