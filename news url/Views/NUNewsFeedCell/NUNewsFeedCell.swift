//
//  NUNewsFeedCell.swift
//  news url
//
//  Created by dor ditchi on 22/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit

class NUNewsFeedCell : UITableViewCell{
    
    @IBOutlet weak var articleImg: UIImageView!
    
    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var publishedAtL: UILabel!
    
    @IBOutlet weak var authorL: UILabel!
    @IBAction func shareButton(_ sender: UIButton) {
        
//        NotificationCenter.default.post(name: "shareNotification", object: self))
 
        NotificationCenter.default.post(name: Notification.Name(rawValue: "shareNotification"), object: nil, userInfo: ["cell": self])

    }
}
