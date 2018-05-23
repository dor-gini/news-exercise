//
//  NUParser.swift
//  news url
//
//  Created by dor ditchi on 22/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit

struct NUParser{
    
    static func parseDataToArticles(withData data:Data) -> [NUArticle]{
        do {
            let articlesData = try JSONDecoder().decode(NUDataRecieved.self, from: data)
            guard var articles =  articlesData.articles else {return []}
            
            for var i in 0...articles.count {
                if i%3==0{
                    articles[i].cellType = .LongCell
                    
                }else{
                    articles[i].cellType = .HighCell
                }
            }
            return articles
            //Get back to the main queue
            
        } catch let jsonError {
            print(jsonError)
            return []
        }
        
    }
    
    static func parseDateFromString(date:String,forArticalIndex index:Int)->String
    {
       
            let inFormatter = ISO8601DateFormatter()
            
            inFormatter.formatOptions=[.withFullDate,.withTime,.withDashSeparatorInDate,.withColonSeparatorInTime,]
            let date1=inFormatter.date(from: date)

            let outFormatter = DateFormatter()
            outFormatter.locale = Locale(identifier: "en_US_POSIX")
            outFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            outFormatter.dateFormat = "dd/MM/YYYY HH:mm"

            let outStr = outFormatter.string(from: date1!)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "article published time updated"), object: nil, userInfo: ["index": index,"parsedPublishedTime":outStr])
            return outStr
    
    }
}
