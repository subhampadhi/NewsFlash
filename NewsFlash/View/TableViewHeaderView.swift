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
        label.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
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

        contentView.addSubview(breakingNewsLabel)
        contentView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        breakingNewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:15).isActive = true
        breakingNewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        breakingNewsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        breakingNewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
