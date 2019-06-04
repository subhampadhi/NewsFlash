//
//  NewsViewCells.swift
//  NewsFlash
//
//  Created by Subham Padhi on 03/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class NewsCellOne: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        initViews()
    }
    
    var newsHeadingLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-BoldItalic", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var newsImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var newsDescriptionLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-BoldItalic", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        
        contentView.addSubview(newsImage)
        contentView.addSubview(newsHeadingLabel)
        contentView.addSubview(newsDescriptionLabel)
        
        newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        newsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        newsHeadingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        newsHeadingLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 15).isActive = true
        newsHeadingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        newsDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        newsDescriptionLabel.topAnchor.constraint(equalTo: newsHeadingLabel.bottomAnchor, constant: 10).isActive = true
        newsDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        newsDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
    }
}

class NewsCellTwo: UITableViewCell {
    
    var newsHeadingLabelOne: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-BoldItalic", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var newsImageOne: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var newsDescriptionLabelOne: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-BoldItalic", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var newsHeadingLabelTwo: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-BoldItalic", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var newsImageTwo: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var newsDescriptionLabelTwo: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-BoldItalic", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var newsBoxView1: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    var newsBoxView2: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        
        contentView.addSubview(newsBoxView1)
        contentView.addSubview(newsBoxView2)
        
        newsBoxView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        newsBoxView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        newsBoxView1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        newsBoxView1.widthAnchor.constraint(equalToConstant: (contentView.frame.width/2)).isActive = true
        
        newsBoxView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        newsBoxView2.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        newsBoxView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        newsBoxView2.widthAnchor.constraint(equalToConstant: (contentView.frame.width/2) ).isActive = true
        
        newsBoxView1.addSubview(newsImageOne)
        newsBoxView1.addSubview(newsHeadingLabelOne)
        newsBoxView1.addSubview(newsDescriptionLabelOne)
        
        newsImageOne.leadingAnchor.constraint(equalTo: newsBoxView1.leadingAnchor, constant: 10).isActive = true
        newsImageOne.topAnchor.constraint(equalTo: newsBoxView1.topAnchor, constant: 10).isActive = true
        newsImageOne.trailingAnchor.constraint(equalTo: newsBoxView1.trailingAnchor, constant: -10).isActive = true
        newsImageOne.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        newsHeadingLabelOne.leadingAnchor.constraint(equalTo: newsBoxView1.leadingAnchor, constant: 15).isActive = true
        newsHeadingLabelOne.topAnchor.constraint(equalTo: newsImageOne.bottomAnchor, constant: 15).isActive = true
        newsHeadingLabelOne.trailingAnchor.constraint(equalTo: newsBoxView1.trailingAnchor, constant: -15).isActive = true
        
        newsDescriptionLabelOne.leadingAnchor.constraint(equalTo: newsBoxView1.leadingAnchor, constant: 15).isActive = true
        newsDescriptionLabelOne.topAnchor.constraint(equalTo: newsHeadingLabelOne.bottomAnchor, constant: 10).isActive = true
        newsDescriptionLabelOne.trailingAnchor.constraint(equalTo: newsBoxView1.trailingAnchor, constant: -15).isActive = true
        newsDescriptionLabelOne.bottomAnchor.constraint(equalTo: newsBoxView1.bottomAnchor, constant: -10).isActive = true
        
        newsBoxView2.addSubview(newsImageTwo)
        newsBoxView2.addSubview(newsHeadingLabelTwo)
        newsBoxView2.addSubview(newsDescriptionLabelTwo)
        
        newsImageTwo.leadingAnchor.constraint(equalTo: newsBoxView2.leadingAnchor, constant: 10).isActive = true
        newsImageTwo.topAnchor.constraint(equalTo: newsBoxView2.topAnchor, constant: 10).isActive = true
        newsImageTwo.trailingAnchor.constraint(equalTo: newsBoxView2.trailingAnchor, constant: -10).isActive = true
        newsImageTwo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        newsHeadingLabelTwo.leadingAnchor.constraint(equalTo: newsBoxView2.leadingAnchor, constant: 15).isActive = true
        newsHeadingLabelTwo.topAnchor.constraint(equalTo: newsImageTwo.bottomAnchor, constant: 15).isActive = true
        newsHeadingLabelTwo.trailingAnchor.constraint(equalTo: newsBoxView2.trailingAnchor, constant: -15).isActive = true
        
        newsDescriptionLabelTwo.leadingAnchor.constraint(equalTo: newsBoxView2.leadingAnchor, constant: 15).isActive = true
        newsDescriptionLabelTwo.topAnchor.constraint(equalTo: newsHeadingLabelTwo.bottomAnchor, constant: 10).isActive = true
        newsDescriptionLabelTwo.trailingAnchor.constraint(equalTo: newsBoxView2.trailingAnchor, constant: -15).isActive = true
        newsDescriptionLabelTwo.bottomAnchor.constraint(equalTo: newsBoxView2.bottomAnchor, constant: -10).isActive = true
    }
}
