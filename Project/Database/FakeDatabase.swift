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
    
    // MARK: - Properties
    
    private var activityList: [Activity] = [
        Activity(name: "Tour of Eiffel Tower", price: "$52 / person", photo: UIImage(systemName: "book")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter"),
        Activity(name: "Riverboat Cruise", price: "$30 / person", photo: UIImage(systemName: "books.vertical")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter"),
        Activity(name: "Art at the Louvre", price: "$55 / person", photo: UIImage(systemName: "book.closed")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter"),
        Activity(name: "French Pastry Tour", price: "$100 / person", photo: UIImage(systemName: "character.book.closed")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter"),
        Activity(name: "Cabaret Show", price: "$85 / person", photo: UIImage(systemName: "bookmark")!, detail: "test etstset set sets etset set set sets etse tset se", host: "Hosted by: Peter")
    ]
    
    private var userList: [User] = [
        User(email: "test@test.com", password: "123456"),
        User(email: "test2@test.com", password: "123456789")
    ]
    
    // MARK: - Getters / Setters
    
    func getAllActivities() -> [Activity] {
        return activityList
    }
    
    func checkIfUserExists(email: String, password: String) -> Bool {
        
        // TODO:  return a Tuple or a Result rather than Bool to send the message

        let user = userList.filter({ $0.email.lowercased() == email.lowercased() }).first
        
        guard let user = user else {
            print("DEBUG: There is no user associated with this email.")
            return false
        }
        
        let isPasswordValid = user.password == password
        
        if !isPasswordValid {
            print("DEBUG: The password is incorrect.")
            return false
        }
        
        print("DEBUG: Successfully logged in..")
        return true
    }
}
