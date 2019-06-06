//
//  NewsViewModel.swift
//  NewsFlash
//
//  Created by Subham Padhi on 03/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    var message: Message?
    var letestNews: [LatestNew]?
    var breakingNews: [String]?
    var mainStory: MainStory?
    var reloadData: (() -> ())?
    let tableCellTypes: [CellFunctions.Type] = [NewsCellOneViewModel.self , NewsCellTwoViewModel.self]
    
    private(set) var tableCells = [CellFunctions]()
    
    init() {
        self.assignTableViewCells()
    }
    func assignTableViewCells() {
        self.tableCells = self.setupTableViewCells()
    }
}

extension NewsViewModel {
    
    func setupTableViewCells() -> [CellFunctions] {
        
        var cellViewModels = [CellFunctions]()
        if (mainStory != nil) {
            let newsCellOne = NewsCellOneViewModel(newsHeading: mainStory?.id ?? "", newsDescription: mainStory?.title ?? "", newsImage: mainStory?.url ?? "")
            cellViewModels.append(newsCellOne)
        }
        
        if letestNews != nil {
            var counter = 0

            for (index ,result) in letestNews!.enumerated() {
                if counter == 4 {
                    print("Missed !!")
                    counter = 0
                }
                if counter == 3 {
                    let indexOne = self.letestNews?[index]
                    let indexTwo = self.letestNews?[index + 1]
                    
                    let newsCellTwo = NewsCellTwoViewModel(newsHeadingOne: indexOne?.id ?? " ", newsDescriptionOne: indexOne?.article_desc ?? " ", newsImageOne: indexOne?.url ?? " ", newsHeadingTwo: indexTwo?.id ?? " ", newsDescriptionTwo: indexTwo?.article_desc ?? " ", newsImageTwo: indexTwo?.url ?? " ")
                    
                    cellViewModels.append(newsCellTwo)
                    counter += 1
                }
                 else {
                        let indexOne = self.letestNews?[index]
                        let newsCellOne = NewsCellOneViewModel(newsHeading: indexOne?.id ?? " ", newsDescription: indexOne?.article_desc ?? " ", newsImage: indexOne?.url ?? " ")
                        cellViewModels.append(newsCellOne)
                        counter += 1
                    }
                }
            }
        return cellViewModels
    }
    
    func getData(url:String) {
        guard let url = NSURL(string : url) else {return}
        URLSession.shared.dataTask(with: url.absoluteURL!) { (data, response
            , error) in
            if let error = error {
                print(error)
            }
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let value = try decoder.decode(Result.self, from: data)
                self.message = value.message
                self.letestNews = value.message?.latest_news
                self.breakingNews = value.message?.breaking_news
                self.mainStory = value.message?.main_story
                self.reloadData?()
            } catch let err {
                print(err)
            }
            }.resume()
    }
}
