//
//  NULongCellConfigurator.swift
//  news url
//
//  Created by dor ditchi on 23/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit
class NULongCellConfigurator: NUNewsFeedApiDelegate  {
    func updateArticles(with articles: [NUArticle]) {
        
    }
    
    func errorGetingArticles(error: Error) {
        
    }
    
    func gotImageData(data: Data, indexPath: IndexPath) {
        
    }
    
    
    
    static func configureCell(withArticleData data:NUArticle, forTableView tableView:UITableView, atRow indexPath:IndexPath) -> NUNewsFeedLongCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "NUNewsFeedLongCell", for: indexPath) as! NUNewsFeedLongCell
        
        cell.authorL.text = data.author
        cell.publishedAtL.text=data.parsedPublishedTime
        cell.titleL.text=data.title
        if data.image != nil{
            cell.articleImg.image=UIImage(data:data.image!)
        }else{
            guard let imageUrl=data.urlToImage else {return cell}
            guard let url = URL(string:imageUrl ) else{
                return cell
            }
            let api=NUNewsUrlApi()
            api.delegate=self
            api.downloadImage(url: url, indexPath: indexPath)
            
        }
        return cell
    }
    
}
