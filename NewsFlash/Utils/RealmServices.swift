//
//  RealmServices.swift
//  RealmNotesApp
//
//  Created by Subham Padhi on 23/05/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmServices {
    
    private init() {}
    static let shared = RealmServices()
    
    var realm = try! Realm()
    
    func create<T:Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func update<T: Object>(_ object: T , with dictionary:[String:Any?]) {
        
        do {
            try realm.write {
                for(key , value) in dictionary {
                    object.setValue(value, forKey: key )
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete<T:Object>(_ Object:T) {
        do {
            try realm.write {
                realm.delete(Object)
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
}

