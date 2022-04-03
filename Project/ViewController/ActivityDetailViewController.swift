
import UIKit

class ActivityDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Properties
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var hostLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    // MARK: - KACHUN
    let defaults = UserDefaults.standard
    @IBOutlet weak var pickerForDate: UIDatePicker!
    @IBOutlet weak var pickerForNum: UIPickerView!
    var pickerForNumData = ["1", "2", "3", "4", "5"]
    var CURRENT_USER: String? = nil
    
    @IBAction func btnPressed(_ sender: Any) {
        
        let date = pickerForDate.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let str = formatter.string(from: date)
        let selectedIndex = self.pickerForNum.selectedRow(inComponent: 0)
        print(pickerForNumData[selectedIndex])
        
        let totalPrice = Double((selectedIndex + 1)) * self.activity!.price
        
        let box = UIAlertController(title: "Total price: \(totalPrice)", message: "Do you confirm this purchase?", preferredStyle: .actionSheet)
        box.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        box.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            // add to purchase list
            let newPurchase = Purchase(name: self.activity!.name, quantity: selectedIndex+1, dateOfVisit: str, pricePerHead: self.activity!.price)
            
            var purchaseList = FakeDatabase.shared.getFromDefault(defaults: self.defaults, username: self.CURRENT_USER!)
            purchaseList.list.append(newPurchase)
            FakeDatabase.shared.saveToDefault(defaults: self.defaults, username: self.CURRENT_USER!, purchaseList: purchaseList)
            
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
    
    var activity: Activity? = nil
    //KACHUN
    
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
            priceLabel.text = "Price per person: $\(activity.price)"
            
            // MARK: - KACHUN
            self.pickerForNum.delegate = self
            self.pickerForNum.dataSource = self
            pickerForDate.minimumDate = Date()
            self.CURRENT_USER = defaults.string(forKey: "CURRENT_LOGIN_USER")
            //KACHUN
        }
    }
    
    
    // MARK: - Selectors
    
    @IBAction func websiteLinkTapped(_ sender: UIButton) {
        guard let webViewVC = storyboard?.instantiateViewController(withIdentifier: "WebViewVC") as? WebViewViewController else {
            print("DEBUG: Error while pushing webViewVC")
            return
        }
                
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
    
}
