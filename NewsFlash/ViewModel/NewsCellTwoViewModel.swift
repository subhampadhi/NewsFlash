//
//  NewsCellTwoViewModel.swift
//  NewsFlash
//
//  Created by Subham Padhi on 03/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class NewsCellTwoViewModel {
    
    
    let newsHeadingOne: String
    let newsDescriptionOne: String
    let newsImageOne: String
    let newsHeadingTwo: String
    let newsDescriptionTwo: String
    let newsImageTwo: String
    var sendIndexPath:((Int , String) -> ())?
    
    init(newsHeadingOne: String , newsDescriptionOne: String ,newsImageOne:String , newsHeadingTwo: String , newsDescriptionTwo: String ,newsImageTwo:String) {
        
        self.newsHeadingOne = newsHeadingOne
        self.newsDescriptionOne = newsDescriptionOne
        self.newsImageOne = newsImageOne
        self.newsHeadingTwo = newsHeadingTwo
        self.newsDescriptionTwo = newsDescriptionTwo
        self.newsImageTwo = newsImageTwo
    }
}

extension NewsCellTwoViewModel: CellFunctions {
    static func registerCell(tableView: UITableView) {
        tableView.register(NewsCellTwo.self, forCellReuseIdentifier: "newsCellTwo")
    }
    
    func cellInstantiate(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCellTwo", for: indexPath) as! NewsCellTwo
        cell.newsImageOne.image = UIImage(url: URL(string:newsImageOne))
        cell.newsImageTwo.image = UIImage(url: URL(string: newsImageTwo))
        cell.newsHeadingLabelOne.text = newsHeadingOne
        cell.newsHeadingLabelTwo.text = newsHeadingTwo
        cell.newsDescriptionLabelOne.text = newsDescriptionOne
        cell.newsDescriptionLabelTwo.text = newsDescriptionTwo
        cell.selectionStyle = .none
        cell.newsDescriptionOneTapped = { () in
            self.sendIndexPath?(indexPath.row , BoxNum.left.rawValue)
        }
        cell.newsDescriptionTwoTapped = { () in
            self.sendIndexPath?(indexPath.row , BoxNum.right.rawValue)
        }
        return cell
    }
}

public enum BoxNum: String {
    case left = "left"
    case right = "right"
}
