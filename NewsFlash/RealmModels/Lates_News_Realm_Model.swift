//
//  Lates_News_Realm_Model.swift
//  NewsFlash
//
//  Created by Subham Padhi on 12/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//


import Foundation
import RealmSwift

@objcMembers class Latest_News_Realm_Model: Object {
    
    dynamic var article_desc : String = ""
    dynamic var article_url : String = ""
    dynamic var id : String = ""
    dynamic var type : String = ""
    dynamic var updateAt : String = ""
    dynamic var url : String = ""
    
    convenience init(article_desc:String , article_url:String ,id:String ,type:String ,updateAt:String ,url:String) {
        self.init()
        self.article_desc = article_desc
        self.article_url = article_url
        self.id = id
        self.type = type
        self.updateAt = updateAt
        self.url = url
    }
}
