
import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String = ""
    let defaults = UserDefaults.standard
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))

        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    
    // MARK: - Selectors
    
    @objc private func logoutButtonTapped() {
        defaults.set(false, forKey: "logged")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(identifier: "LoginVC")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginVC)
    }
    

}
