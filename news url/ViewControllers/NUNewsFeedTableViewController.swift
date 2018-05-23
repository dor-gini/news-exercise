//
//  NUNewsFeedTableViewController.swift
//  news url
//
//  Created by dor ditchi on 22/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit

class NUNewsFeedTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NUNewsFeedApiDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var articleArr:[NUArticle]?
    
    func updateArticles(with articles: [NUArticle]) {
        self.articleArr=articles
        self.tableView.reloadData()
    }
    
    func errorGeetingArticles(error: Error) {
    
    }
    
    func gotImageData(data: Data, indexPath :IndexPath) {
        guard let cell=self.tableView.cellForRow(at: indexPath) else {return}
        let customeCell = cell as! NUNewsFeedCell
        customeCell.articleImg.image=UIImage(data: data)
        self.articleArr![indexPath.row].image=data
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCustomeCells()
        let api=NUNewsUrlApi()
        api.delegate=self
        api.getAllArticles()
        NotificationCenter.default.addObserver(self, selector: #selector(shareButton(_:)), name: Notification.Name(rawValue: "shareNotification"), object: nil)
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 140
//        tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @objc func shareButton(_ notification: NSNotification){
        print(self.tableView.indexPath(for: notification.userInfo?["cell"] as! NUNewsFeedCell));
    }
    
    func registerCustomeCells(){
        tableView.register(UINib(nibName: "NUNewsFeedCell", bundle: nil), forCellReuseIdentifier: "NUNewsFeedCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let articles=self.articleArr else {return 0}
        return articles.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NUNewsFeedCell", for: indexPath) as! NUNewsFeedCell
        if self.articleArr![indexPath.row].parsedPublishedTime == nil{
        self.articleArr![indexPath.row].parsedPublishedTime=NUParser.parseDateFromString(date: articleArr![indexPath.row].publishedAt!)
        }
        guard let articles = self.articleArr else {return cell}
        cell.authorL.text = articles[indexPath.row].author
        
        cell.publishedAtL.text=articles[indexPath.row].parsedPublishedTime
        cell.titleL.text=articles[indexPath.row].title
        if articles[indexPath.row].image != nil{
            cell.articleImg.image=UIImage(data:articles[indexPath.row].image!)
        }else{
        guard let imageUrl=self.articleArr![indexPath.row].urlToImage else {return cell}
        guard let url = URL(string:imageUrl ) else{
            return cell
        }
        let api=NUNewsUrlApi()
        api.delegate=self
            api.downloadImage(url: url, indexPath: indexPath)}
        return cell
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let WKPVC = storyboard.instantiateViewController(withIdentifier: "WebKitPage") as! NUWebKitViewController
        WKPVC.urlToLoad = self.articleArr![indexPath.row].url
        self.navigationController?.pushViewController(WKPVC, animated: true)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
