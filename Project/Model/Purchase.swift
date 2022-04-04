
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
    var total: Double {
        get {
            if self.list.count == 0 { return 0 }
            var sum: Double = 0
            for purchase in self.list {
                sum += purchase.price
            }
            return sum
        }
    }
}
