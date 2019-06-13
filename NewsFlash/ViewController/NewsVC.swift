//
//  NewsVC.swift
//  NewsFlash
//
//  Created by Subham Padhi on 03/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class NewsVC: NewsView {
    
    let viewModel = NewsViewModel()
    var timer = Timer()
    var tableViewHeaderView = TableViewHeaderView()
    
    var time: Int = 0 {
        didSet {
            reloadTableviewHeader()
        }
    }
    
    func reloadTableviewHeader() {
        
        self.tableViewHeaderView.breakingNewsLabel.text =  self.viewModel.breaking_News?[time].article
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        if isViewLoaded
        {
            self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(NewsVC.increaseTimer), userInfo: nil, repeats: true)
            reloadTableviewHeader()
        }
    }
    
    override func viewDidLoad() {
        
        newsTable.dataSource = self
        newsTable.delegate = self
        newsTable.register(TableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "tableViewHeaderView")
        setUpViews()
        self.viewModel.tableCellTypes.forEach({ $0.registerCell(tableView: self.newsTable)})
        viewModel.getData(url: AllUrls.getAllNews.rawValue)
        handleClosures()
    }
}

extension NewsVC {
    
    func handleClosures() {
        
        viewModel.reloadData = {
            DispatchQueue.main.async { [weak  self] in
                self?.viewModel.saveToRealm()
                self?.viewModel.assignTableViewCells()
                self?.newsTable.reloadData()
                
            }
        }
        
        viewModel.reloadPersistentData = {
            DispatchQueue.main.async { [weak  self] in
                self?.viewModel.assignTableViewCells()
                self?.newsTable.reloadData()
            }
        }
        viewModel.moveToNextScreenCompletion = { (url) in
            
            guard let url = URL(string: url ) else {return}
            print(url)
            if InternetRechability.isConnectedToNetwork(){
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
                }
            }
        }
    }
}

extension NewsVC {
    
    @objc func increaseTimer() {
        if ((viewModel.breakingNews?.count) != nil) {
            if time == (viewModel.breakingNews?.count)! - 1  {
                time = 0
            }else {
                time += 1
            }
        }
    }
}

extension NewsVC: UITableViewDelegate {
}

extension NewsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = self.viewModel.tableCells[indexPath.row]
        return cellViewModel.cellInstantiate(tableView: tableView,indexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        tableViewHeaderView = self.newsTable.dequeueReusableHeaderFooterView(withIdentifier: "tableViewHeaderView" ) as! TableViewHeaderView
        tableViewHeaderView.breakingNewsLabel.text = viewModel.breakingNews?[time]
        tableViewHeaderView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return tableViewHeaderView
    }
}
