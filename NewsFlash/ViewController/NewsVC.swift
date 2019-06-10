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
    var time: Int = 0 {
        didSet {
            reloadTableviewHeader()
        }
    }
    
    func reloadTableviewHeader() {
        print("reloading")
        self.tableViewHeaderView.breakingNewsLabel.text =  self.viewModel.breakingNews?[time]
    }
    var tableViewHeaderView = TableViewHeaderView()
    var setUpUI: ((Int) -> ())?
    
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
        
//        tableViewHeaderView.contentView.setNeedsLayout()
        
        viewModel.reloadData = {
            DispatchQueue.main.async {
                self.viewModel.assignTableViewCells()
                self.newsTable.reloadData()
            }
        }
    }
}

extension NewsVC {
    
    @objc func increaseTimer() {
        if ((viewModel.breakingNews?.count) != nil) {
            if time == (viewModel.breakingNews?.count)! - 1  {
                time = 0
                self.tableViewHeaderView.breakingNewsLabel.text =  self.viewModel.breakingNews?[time]
                tableViewHeaderView.contentView.setNeedsLayout()
            }else {
                time += 1
                self.tableViewHeaderView.breakingNewsLabel.text =  self.viewModel.breakingNews?[time]
                tableViewHeaderView.contentView.setNeedsLayout()
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
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.newsTable.dequeueReusableHeaderFooterView(withIdentifier: "tableViewHeaderView" ) as! TableViewHeaderView
        headerView.breakingNewsLabel.text = viewModel.breakingNews?[time]
        return headerView
    }
}
