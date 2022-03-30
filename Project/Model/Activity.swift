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
    
    init(name: String, price: String, photo: UIImage) {
        self.name = name
        self.price = price
        self.photo = photo
    }
}
