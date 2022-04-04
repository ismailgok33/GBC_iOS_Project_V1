
import UIKit

class FakeDatabase {
    
    static let shared = FakeDatabase()
    
    private init() {}
    
    // MARK: - Properties
    
    private var activityList: [Activity] = [
        Activity(name: "Tour of Eiffel Tower",
                 price: 52,
                 photo: UIImage(named: "Image1")!,
                 detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                 host: "Hosted by: Peter",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b",
                 isPopular: false),
        Activity(name: "Riverboat Cruise",
                 price: 30,
                 photo: UIImage(named: "Image2")!,
                 detail: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                 host: "Hosted by: Eva",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b",
                 isPopular: false),
        Activity(name: "Art at the Louvre",
                 price: 55,
                 photo: UIImage(named: "Image3")!,
                 detail: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
                 host: "Hosted by: Sarah",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b",
                 isPopular: true),
        Activity(name: "French Pastry Tour",
                 price: 100,
                 photo: UIImage(named: "Image1")!,
                 detail: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                 host: "Hosted by: Jake",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b",
                 isPopular: true),
        Activity(name: "Cabaret Show",
                 price: 85,
                 photo: UIImage(named: "Image2")!,
                 detail: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                 host: "Hosted by: Alex",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b",
                 isPopular: false)
    ]
    
    private var userList: [User] = [
        User(email: "test", password: "123"),
        User(email: "test2", password: "1234")
    ]
    
    // MARK: - Getters / Setters
    
    func getAllActivities() -> [Activity] {
        return activityList
    }
    
    // MARK: - Service Functions
    
    func checkIfUserExists(email: String, password: String) -> Bool {
        
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
    
    func saveToDefault(_ defaults: UserDefaults, _ username: String, _ purchaseList: PurchaseList) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(purchaseList) {
            defaults.set(encoded, forKey: username)
        }
    }

    func getFromDefault(_ defaults: UserDefaults, _ username: String) -> PurchaseList {
        if let savedList = defaults.object(forKey: username) as? Data {
            let decoder = JSONDecoder()
            if let loadedPurchase = try? decoder.decode(PurchaseList.self, from: savedList) {
                return loadedPurchase
            }
        }
        return PurchaseList()
    }
    
}
