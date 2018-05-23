//
//  NUNewsUrlApi.swift
//  news url
//
//  Created by dor ditchi on 22/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit


protocol NUNewsFeedApiDelegate{
    func updateArticles(with articles: [NUArticle])
    func errorGeetingArticles(error:Error)
    func gotImageData(data:Data, indexPath :IndexPath)
}

class NUNewsUrlApi {
    
    var delegate:NUNewsFeedApiDelegate?
    
    func getAllArticles(){
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=85051b9496c0487da2eb7476be7b1954"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            let articles = NUParser.parseDataToArticles(withData: data)
            
            DispatchQueue.main.async {
                guard let del=self.delegate else {return}
                del.updateArticles(with: articles)
            }
            }.resume()
    }
    
     func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
     func downloadImage(url: URL, indexPath : IndexPath) {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                guard let del=self.delegate else {return}
                del.gotImageData(data: data , indexPath: indexPath)
            }
        }
    }
    
}
