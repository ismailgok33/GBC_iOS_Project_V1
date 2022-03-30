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
        Activity(name: "Tour of Eiffel Tower", price: "$52 / person", photo: UIImage(systemName: "book")!),
        Activity(name: "Riverboat Cruise", price: "$30 / person", photo: UIImage(systemName: "books.vertical")!),
        Activity(name: "Art at the Louvre", price: "$55 / person", photo: UIImage(systemName: "book.closed")!),
        Activity(name: "French Pastry Tour", price: "$100 / person", photo: UIImage(systemName: "character.book.closed")!),
        Activity(name: "Cabaret Show", price: "$85 / person", photo: UIImage(systemName: "bookmark")!)
    ]
}
