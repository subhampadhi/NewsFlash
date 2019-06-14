//
//  NewsViewModel.swift
//  NewsFlash
//
//  Created by Subham Padhi on 03/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import RealmSwift

class NewsViewModel {
    
    var message: Message?
    var letestNews: [LatestNew]?
    var breakingNews: [String]?
    var mainStory: MainStory?
    var reloadData: (() -> ())?
    var reloadPersistentData: (() -> ())?
    let tableCellTypes: [CellFunctions.Type] = [NewsCellOneViewModel.self , NewsCellTwoViewModel.self]
    var moveToNextScreenCompletion: ((String) -> ())?
    let apiManager = ApiManager()
    
    var timer = Timer()
    var isInternetRechable: Bool = false {
        didSet {
            if !isInternetRechable {
                getData(url: AllUrls.getAllNews.rawValue)
            }
        }
    }
    
    var latest_News: Results<Latest_News_Realm_Model>?
    var breaking_News: Results<Breaking_News_Realm_Model>?
    var main_Story: Results<Main_Story_Realm_Model>?
    
    let realm = RealmServices.shared.realm
    
    private(set) var tableCells = [CellFunctions]()
    
    init() {
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(NewsViewModel.checkInternetConnection), userInfo: nil, repeats: true)
        self.assignTableViewCells()
    }
    
    func assignTableViewCells() {
        self.tableCells = self.setupTableViewCells()
    }
}

extension NewsViewModel {
    
    @objc func checkInternetConnection() {
        self.isInternetRechable = InternetRechability.isConnectedToNetwork()
    }
    
    func setupTableViewCells() -> [CellFunctions] {
        
        var cellViewModels = [CellFunctions]()
        
        latest_News = realm.objects(Latest_News_Realm_Model.self)
        breaking_News = realm.objects(Breaking_News_Realm_Model.self)
        main_Story = realm.objects(Main_Story_Realm_Model.self)
        
        if (main_Story != nil) {
            
            let newsCellOne = NewsCellOneViewModel(newsHeading: main_Story?[0].id ?? "" , newsDescription: main_Story?[0].title ?? "", newsImage: main_Story?[0].url ?? "")
            cellViewModels.append(newsCellOne)
        }
        
        if latest_News != nil {
            var counter = 0
            for (index ,_) in latest_News!.enumerated() {
                if counter == 4 {
                    counter = 0
                }
                if counter == 3 {
                    // two news items in one
                    let indexOne = latest_News?[index]
                    let indexTwo = latest_News?[index + 1]
                    let newsCellTwo = NewsCellTwoViewModel(newsHeadingOne: indexOne?.id ?? " ", newsDescriptionOne: indexOne?.article_desc ?? " ", newsImageOne: indexOne?.url ?? " ", newsHeadingTwo: indexTwo?.id ?? " ", newsDescriptionTwo: indexTwo?.article_desc ?? " ", newsImageTwo: indexTwo?.url ?? " ")
                    cellViewModels.append(newsCellTwo)
                    
                    
                    newsCellTwo.sendIndexPath = { (index , Box) in
                        
                        if Box == BoxNum.left.rawValue {
                            let webUrl:String = indexOne?.article_url ?? ""
                            self.moveToNextScreenCompletion?(webUrl)
                        } else {
                            let webUrl:String = indexTwo?.article_url ?? ""
                            self.moveToNextScreenCompletion?(webUrl)
                        }
                    }
                    counter += 1
                }
                else {
                    let indexOne = latest_News?[index]
                    let newsCellOne = NewsCellOneViewModel(newsHeading: indexOne?.id ?? " ", newsDescription: indexOne?.article_desc ?? " ", newsImage: indexOne?.url ?? " ")
                    cellViewModels.append(newsCellOne)
                    
                    newsCellOne.sendIndexPath = {(index) in
                        let webUrl:String = indexOne?.article_url ?? ""
                        print(webUrl)
                        self.moveToNextScreenCompletion?(webUrl)
                    }
                    counter += 1
                }
            }
        }
        return cellViewModels
    }
    
    func getData(url:String) {
        
        guard let url = NSURL(string : url) else {return}
        self.apiManager.makeRequest(toURL: url as URL, withHttpMethod: .get) { (results) in
            
            if let error = results.error {
                print(error)
                self.reloadPersistentData?()
            }
            if let response = results.response {
                print(response)
            }
            guard let data = results.data else { return }
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
        }
}
    
func saveToRealm() {
    
    let realm = try! Realm()
    let latestNewsObjects = realm.objects(Latest_News_Realm_Model.self)
    let breakingNewsObject = realm.objects(Breaking_News_Realm_Model.self)
    let mainStoryObject = realm.objects(Main_Story_Realm_Model.self)
    
    try! realm.write {
        realm.delete(latestNewsObjects)
        realm.delete(breakingNewsObject)
        realm.delete(mainStoryObject)
    }
    
    for i in self.letestNews! {
        let newEntry = Latest_News_Realm_Model(article_desc: i.article_desc ?? "", article_url: i.article_url ?? "", id: i.id ?? "", type: i.type ?? "", updateAt: i.updateAt ?? "", url: i.url ?? "")
        RealmServices.shared.create(newEntry)
    }
    
    for news in breakingNews! {
        let newEntry = Breaking_News_Realm_Model(article: news )
        RealmServices.shared.create(newEntry)
    }
    
    let newEntry = Main_Story_Realm_Model(article_desc: mainStory?.title ?? " ", article_url: mainStory?.article_url ?? "", id: mainStory?.id ?? " ", type: mainStory?.type ?? " ", updateAt: mainStory?.updateAt ?? " ", url:mainStory?.url ?? "")
    RealmServices.shared.create(newEntry)
}
}
