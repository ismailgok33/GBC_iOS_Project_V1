//
//  ActivityCollectionViewCell.swift
//  Project
//
//  Created by İsmail on 30.03.2022.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "activityCell"
    
    @IBOutlet var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ActivityCollectionViewCell", bundle: nil)
    }

}
