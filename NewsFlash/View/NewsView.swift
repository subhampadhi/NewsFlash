//
//  NewsView.swift
//  NewsFlash
//
//  Created by Subham Padhi on 03/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class NewsView: UIViewController {
    
    
    var newsTable:UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpViews() {
        navigationItem.title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(newsTable)
        newsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        newsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        newsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        newsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        newsTable.estimatedRowHeight = 180
        newsTable.rowHeight = UITableView.automaticDimension
    }
}
