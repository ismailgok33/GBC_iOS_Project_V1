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
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    let defaults = UserDefaults.standard
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if defaults.bool(forKey: "logged") {
//            guard let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "tabBarController") else {
//                print("DEBUG: Error while pushing tabBarController")
//                return
//            }
//
//            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarVC)
//        }
    }
    
    // MARK: - Selectors
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        guard let email = emailText.text, let password = passwordText.text, !email.isEmpty, !password.isEmpty else {
            
            // TODO: Show alert
            print("DEBUG: Email and Password fields must be filled.")
            
            return
        }
        
        // TODO: Check the login credentials
        if !FakeDatabase.shared.checkIfUserExists(email: email, password: password) {
            
            // TODO: Show alert
            print("DEBUG: Show login error message here..")
            
            return
        }
        
        guard let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "tabBarController") else {
            print("DEBUG: Error while pushing tabBarController")
            return
        }
        
        if rememberSwitch.isOn {
            defaults.set(true, forKey: "logged")
        }
        else {
            defaults.set(false, forKey: "logged")
        }
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarVC)

    }
    

}

