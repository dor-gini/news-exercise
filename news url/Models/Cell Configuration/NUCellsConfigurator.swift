//
//  NUCellsConfigurator.swift
//  news url
//
//  Created by dor ditchi on 23/05/2018.
//  Copyright © 2018 dor ditchi. All rights reserved.
//

import UIKit
enum CellType : Int,Codable {
    case LongCell
    case HighCell
}

class NUCellsConfigurator {
    
    static func configureCell(type cellType : CellType,withArticleData data:NUArticle,inTableView tableView:UITableView,atRow indexPath:IndexPath) -> UITableViewCell{
        
        switch cellType {
        case .LongCell:
            return NULongCellConfigurator.configureCell(withArticleData: data,forTableView: tableView,atRow: indexPath)
        case .HighCell:
            return NUHighCellConfigurator.configureCell(withArticleData: data,forTableView: tableView,atRow: indexPath)
            
            
        }
        
    }
    
    
}

