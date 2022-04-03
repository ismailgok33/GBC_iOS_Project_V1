
import Foundation

struct Purchase: Codable {
    
    let name: String
    let quantity: Int
    let dateOfVisit: String
    let pricePerHead: Double
    var price: Double {
        get {
            return Double(quantity) * pricePerHead
        }
    }
}

struct PurchaseList: Codable {
    var list: [Purchase] = []
}
