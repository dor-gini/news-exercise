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
            guard let articles =  articlesData.articles else {return []}
            return articles
            //Get back to the main queue
            
        } catch let jsonError {
            print(jsonError)
            return []
        }
        
    }
    
    static func parseDateFromString(date:String)->String
    {
       
            let inFormatter = ISO8601DateFormatter()
            
            inFormatter.formatOptions=[.withFullDate,.withTime,.withDashSeparatorInDate,.withColonSeparatorInTime,]
            let date1=inFormatter.date(from: date)
//            print(date1)
            let outFormatter = DateFormatter()
            outFormatter.locale = Locale(identifier: "en_US_POSIX")
            outFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            outFormatter.dateFormat = "dd/MM/YYYY HH:mm"
//
//            //        let inStr = "16:50"
//
            let outStr = outFormatter.string(from: date1!)
            return outStr
    
    }
}
