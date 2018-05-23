//
//  NUDataRecieved.swift
//  news url
//
//  Created by dor ditchi on 22/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit

struct NUDataRecieved: Codable{
    var status:String?
    var totalResults:Int?
    var articles:[NUArticle]?
}
