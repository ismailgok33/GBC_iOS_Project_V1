//
//  ActivityDetailViewController.swift
//  Project
//
//  Created by İsmail on 30.03.2022.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var hostLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var activity: Activity? = nil
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        if let activity = activity {
            nameLabel.text = activity.name
            imageView.image = activity.photo
            detailLabel.text = activity.detail
            hostLabel.text = activity.host
            priceLabel.text = activity.price
        }
    }
    
    
    // MARK: - Selectors
    
    

}
