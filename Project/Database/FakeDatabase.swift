//
//  FakeDatabase.swift
//  Project
//
//  Created by İsmail on 30.03.2022.
//

import UIKit

class FakeDatabase {
    
    static let shared = FakeDatabase()
    
    private init() {}
    
    private var activityList: [Activity] = [
        Activity(name: "Tour of Eiffel Tower", price: "$52 / person", photo: UIImage(systemName: "book")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter"),
        Activity(name: "Riverboat Cruise", price: "$30 / person", photo: UIImage(systemName: "books.vertical")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter"),
        Activity(name: "Art at the Louvre", price: "$55 / person", photo: UIImage(systemName: "book.closed")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter"),
        Activity(name: "French Pastry Tour", price: "$100 / person", photo: UIImage(systemName: "character.book.closed")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter"),
        Activity(name: "Cabaret Show", price: "$85 / person", photo: UIImage(systemName: "bookmark")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter")
    ]
    
    func getAllActivities() -> [Activity] {
        return activityList
    }
}
