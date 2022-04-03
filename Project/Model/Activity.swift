
import Foundation
import UIKit

class Activity {
    let name: String
    let price: Double // msg: changed from String to Double
    let photo: UIImage
    let detail: String
    let host: String
    let urlString: String
    
    init(name: String, price: Double, photo: UIImage, detail: String, host: String, urlString: String) {
        self.name = name
        self.price = price
        self.photo = photo
        self.detail = detail
        self.host = host
        self.urlString = urlString
    }
}
