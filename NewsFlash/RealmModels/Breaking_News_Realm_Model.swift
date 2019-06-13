//
//  Breaking_News_Realm_Model.swift
//  NewsFlash
//
//  Created by Subham Padhi on 12/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Breaking_News_Realm_Model: Object {
 
    dynamic var article : String = ""
    
    convenience init(article: String) {
        self.init()
        self.article = article
    }
}
