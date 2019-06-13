//
//  Latest_News+CoreDataProperties.swift
//  NewsFlash
//
//  Created by Subham Padhi on 12/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//
//

import Foundation
import CoreData


extension Latest_News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Latest_News> {
        return NSFetchRequest<Latest_News>(entityName: "Latest_News")
    }

    @NSManaged public var article_url: String?
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var updateAt: String?
    @NSManaged public var url: String?

}
