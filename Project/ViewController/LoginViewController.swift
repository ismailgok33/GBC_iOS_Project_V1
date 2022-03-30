//
//  ViewController.swift
//  Project
//
//  Created by İsmail on 29.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Selectors
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        // TODO: Check the login credentials
        
        guard let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "tabBarController") else {
            print("DEBUG: Error while pushing tabBarController")
            return
        }
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarVC)
        
//        self.navigationController?.pushViewController(activitiesVC, animated: true)
//        tabBarVC.modalPresentationStyle = .fullScreen
//        self.present(tabBarVC, animated: true, completion: nil)
    }
    

}

