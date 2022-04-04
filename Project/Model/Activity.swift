
import Foundation
import UIKit

class Activity {
    let name: String
    let price: Double
    let photo: UIImage
    let detail: String
    let host: String
    let urlString: String
    let isPopular: Bool
    
    init(name: String, price: Double, photo: UIImage, detail: String, host: String, urlString: String, isPopular: Bool) {
        self.name = name
        self.price = price
        self.photo = photo
        self.detail = detail
        self.host = host
        self.urlString = urlString
        self.isPopular = isPopular
    }
}
