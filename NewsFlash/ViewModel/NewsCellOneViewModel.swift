//
//  NewsCellViewModel.swift
//  NewsFlash
//
//  Created by Subham Padhi on 03/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class NewsCellOneViewModel {
    
    let newsHeading: String
    let newsDescription: String
    let newsImage: String
    
    init(newsHeading: String , newsDescription: String ,newsImage:String) {
        self.newsHeading = newsHeading
        self.newsDescription = newsDescription
        self.newsImage = newsImage
    }
}

extension NewsCellOneViewModel: CellFunctions {
    
    static func registerCell(tableView: UITableView) {
        tableView.register(NewsCellOne.self, forCellReuseIdentifier: "newsCellOne")
    }
    
    func cellInstantiate(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCellOne", for: indexPath) as! NewsCellOne
       cell.newsImage.image = UIImage(url: URL(string:newsImage))
        cell.newsHeadingLabel.text = newsHeading
        cell.newsDescriptionLabel.text = newsDescription
        return cell
    }
}

extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
