//
//  Main_Story+CoreDataProperties.swift
//  NewsFlash
//
//  Created by Subham Padhi on 12/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//
//

import Foundation
import CoreData


extension Main_Story {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Main_Story> {
        return NSFetchRequest<Main_Story>(entityName: "Main_Story")
    }

    @NSManaged public var article_url: String?
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var updateAt: String?
    @NSManaged public var url: String?

}
