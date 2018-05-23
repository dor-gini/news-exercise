//
//  NUNewsFeedLongCell.swift
//  news url
//
//  Created by dor ditchi on 23/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit

class NUNewsFeedLongCell: UITableViewCell {

    @IBOutlet weak var articleImg: UIImageView!
    
    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var publishedAtL: UILabel!
    
    @IBOutlet weak var authorL: UILabel!
    
    
    @IBAction func shareButton(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "shareNotification"), object: nil, userInfo: ["cell": self])
        
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
