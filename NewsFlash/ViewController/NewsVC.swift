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
    
    override func viewDidLoad() {
        
        newsTable.dataSource = self
        newsTable.delegate = self
        setUpViews()
        self.viewModel.tableCellTypes.forEach({ $0.registerCell(tableView: self.newsTable)})
        viewModel.getData(url: AllUrls.getAllNews.rawValue)
        viewModel.reloadData = {
            DispatchQueue.main.async {
                self.viewModel.assignTableViewCells()
                self.newsTable.reloadData()
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}





