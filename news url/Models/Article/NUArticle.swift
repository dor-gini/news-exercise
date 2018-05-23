//
//  NUArticle.swift
//  news url
//
//  Created by dor ditchi on 22/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit


struct NUArticle : Codable{
    var source: NUArticleSource?
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage: String?
    var publishedAt:String?
    
    var cellType:CellType?
    var image:Data?
    var parsedPublishedTime:String?
}


