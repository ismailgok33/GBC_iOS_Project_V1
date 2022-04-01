//
//  Activity.swift
//  Project
//
//  Created by İsmail on 30.03.2022.
//

import Foundation
import UIKit

class Activity {
    let name: String
    let price: String
    let photo: UIImage
    let detail: String
    let host: String
    
    init(name: String, price: String, photo: UIImage, detail: String, host: String) {
        self.name = name
        self.price = price
        self.photo = photo
        self.detail = detail
        self.host = host
    }
}
