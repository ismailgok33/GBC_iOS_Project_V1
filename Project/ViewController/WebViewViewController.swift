//
//  WebViewViewController.swift
//  Project
//
//  Created by İsmail on 2.04.2022.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "https://www.airbnb.ca/experiences/46255?guests=1&adults=1&s=67&unique_share_id=3d68fb0f-74cd-46d0-905d-7ea40fe9525b") {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    

}
