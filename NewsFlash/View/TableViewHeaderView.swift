//
//  TableViewHeaderView.swift
//  NewsFlash
//
//  Created by Subham Padhi on 06/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class TableViewHeaderView: UITableViewHeaderFooterView {
    
    var changeLabelValue: (() -> ())?
    var breakingNewsLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        label.text = "test test test"
        return label
    }()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setUpViews()
    }
    
    func setUpViews() {
        backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        contentView.addSubview(breakingNewsLabel)
        
        breakingNewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:15).isActive = true
        breakingNewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        breakingNewsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        breakingNewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
