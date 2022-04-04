
import UIKit

class ActivityDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Properties
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var hostLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet weak var pickerForDate: UIDatePicker!
    @IBOutlet weak var pickerForNum: UIPickerView!
    
    let defaults = UserDefaults.standard
    var pickerForNumData = ["1", "2", "3", "4", "5"]
    var CURRENT_USER: String? = nil
    var activity: Activity? = nil
    
    @IBAction func btnPressed(_ sender: Any) {
        
        let date = pickerForDate.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateText = formatter.string(from: date)
        
        let quantity = 1 + self.pickerForNum.selectedRow(inComponent: 0)
        let totalPrice = String(format: "%.2f", Double(quantity) * self.activity!.price)
        let box = UIAlertController(title: "Total price: $\(totalPrice)", message: "Do you confirm this purchase?", preferredStyle: .actionSheet)
        box.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        box.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {
            action in
            
            let newPurchase = Purchase(name: self.activity!.name, quantity: quantity, dateOfVisit: dateText, pricePerHead: self.activity!.price)
            
            //update purchaseList in userDefault
            var purchaseList = FakeDatabase.shared.getFromDefault(self.defaults, self.CURRENT_USER!)
            purchaseList.list.append(newPurchase)
            FakeDatabase.shared.saveToDefault(self.defaults, self.CURRENT_USER!, purchaseList)
            
            // notice for a purchase made
            let notice = UIAlertController(title: "Done!", message: "Your purchase has been added.", preferredStyle: .actionSheet)
            notice.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(notice, animated: true)
        }))
        self.present(box, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerForNumData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerForNumData[row]
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        
        if let activity = activity {
            nameLabel.text = activity.name
            imageView.image = activity.photo
            detailLabel.text = activity.detail
            hostLabel.text = activity.host
            priceLabel.text = "Price per person: $\(activity.price)"
            
            self.pickerForNum.delegate = self
            self.pickerForNum.dataSource = self
            let nextDayOfToday = Calendar.current.date(byAdding: .day, value: 1, to: Date())
            pickerForDate.minimumDate = nextDayOfToday
            self.CURRENT_USER = defaults.string(forKey: "CURRENT_LOGIN_USER")
        }
    }
    
    
    // MARK: - Selectors
    
    @IBAction func websiteLinkTapped(_ sender: UIButton) {
        guard let webViewVC = storyboard?.instantiateViewController(withIdentifier: "WebViewVC") as? WebViewViewController else {
            print("DEBUG: Error while pushing webViewVC")
            return
        }
        
        webViewVC.urlString = activity?.urlString ?? ""
                
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    @objc private func logoutButtonTapped() {
        defaults.set(false, forKey: "logged")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(identifier: "LoginVC")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginVC)
    }
    
}
