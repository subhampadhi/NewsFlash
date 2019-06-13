//
//  Breaking_News+CoreDataProperties.swift
//  NewsFlash
//
//  Created by Subham Padhi on 12/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//
//

import Foundation
import CoreData


extension Breaking_News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Breaking_News> {
        return NSFetchRequest<Breaking_News>(entityName: "Breaking_News")
    }

    @NSManaged public var breaking_news: String?

}
