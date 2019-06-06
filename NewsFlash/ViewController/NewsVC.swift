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
    var time = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(NewsVC.increaseTimer), userInfo: nil, repeats: true)
    }
    
    
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

extension NewsVC {
    
    @objc func increaseTimer() -> Int {
        if time == (viewModel.breakingNews?.count)! - 1  {
            time = 0
            self.newsTable.reloadSections([0], with: .fade)
            return time
        }else {
        time += 1
            self.newsTable.reloadSections([0], with: .fade)
            return time
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.breakingNews?[increaseTimer()]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
}





