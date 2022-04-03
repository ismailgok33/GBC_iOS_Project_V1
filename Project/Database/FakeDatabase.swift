
import UIKit

class FakeDatabase {
    
    static let shared = FakeDatabase()
    
    private init() {}
    
    // MARK: - Properties
    
    private var activityList: [Activity] = [
        Activity(name: "Tour of Eiffel Tower",
                 price: 52,
                 photo: UIImage(named: "Image1")!,
                 detail: "test etstset set sets etset set set sets etse tset se",
                 host: "Hosted by: Peter",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b"),
        Activity(name: "Riverboat Cruise",
                 price: 30,
                 photo: UIImage(named: "Image2")!,
                 detail: "test etstset set sets etset set set sets etse tset se",
                 host: "Hosted by: Peter",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b"),
        Activity(name: "Art at the Louvre",
                 price: 55,
                 photo: UIImage(named: "Image3")!,
                 detail: "test etstset set sets etset set set sets etse tset se",
                 host: "Hosted by: Peter",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b"),
        Activity(name: "French Pastry Tour",
                 price: 100,
                 photo: UIImage(named: "Image1")!,
                 detail: "test etstset set sets etset set set sets etse tset se",
                 host: "Hosted by: Peter",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b"),
        Activity(name: "Cabaret Show",
                 price: 85,
                 photo: UIImage(named: "Image2")!,
                 detail: "test etstset set sets etset set set sets etse tset se",
                 host: "Hosted by: Peter",
                 urlString: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b")
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
    
    func saveToDefault(defaults: UserDefaults, username: String, purchaseList: PurchaseList) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(purchaseList) {
            defaults.set(encoded, forKey: username)
        }
    }

    func getFromDefault(defaults: UserDefaults, username: String) -> PurchaseList {
        if let savedList = defaults.object(forKey: username) as? Data {
            let decoder = JSONDecoder()
            if let loadedPurchase = try? decoder.decode(PurchaseList.self, from: savedList) {
                return loadedPurchase
            }
        }
        return PurchaseList()
    }
    
    func countTotal(list: [Purchase]) -> Double {
        var sum: Double = 0
        for purchase in list {
            sum += purchase.price
        }
        return sum
    }
}
