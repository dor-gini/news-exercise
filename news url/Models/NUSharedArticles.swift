//
//  NUSharedArticles.swift
//  news url
//
//  Created by dor ditchi on 23/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit

class NUSharedArticles {
    static var sharedArticles=NUSharedArticles()
    
    var articleArr:[NUArticle]?
    var notificationObserver:Any?
    private init(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateArticleImg(_:)), name: Notification.Name(rawValue: "article image updated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateArticlePublishedTime(_:)), name: Notification.Name(rawValue: "article published time updated"), object: nil)
        notificationObserver = NotificationCenter.default.addObserver(self, selector: #selector(updateArticlePublishedTime(_:)), name: Notification.Name(rawValue: "fetched articles"), object: nil)
    }
    
    @objc func updateArticleImg(_ notification: NSNotification){
        
        articleArr![notification.userInfo?["index"] as! Int].image = notification.userInfo?["image"] as? Data
        
        
    }
    
    @objc func updateArticlePublishedTime(_ notification: NSNotification){
        
        articleArr![notification.userInfo?["index"] as! Int].parsedPublishedTime = notification.userInfo?["parsedPublishedTime"] as? String
        
    }
    
    @objc func updateArticlesArray(_ notification: NSNotification){
        
        articleArr=notification.userInfo?["fetched articles"] as? [NUArticle]
        NotificationCenter.default.removeObserver(notificationObserver)
    }
}
