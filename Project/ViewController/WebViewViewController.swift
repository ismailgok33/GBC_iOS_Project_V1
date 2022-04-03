
import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String = ""
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    

}
