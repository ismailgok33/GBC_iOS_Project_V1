
import UIKit

class PurchaseTicketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblPurchasedNum: UILabel!
    @IBOutlet weak var tvPurchaseList: UITableView!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblAccountInfo: UILabel!
    let defaults = UserDefaults.standard
    var purchaseList = PurchaseList()
    var currentUser: String? = nil
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseList.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowData = purchaseList.list[indexPath.row]
        let cell = tvPurchaseList.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "Name: \(rowData.name)"
        content.secondaryText = "Date: \(rowData.dateOfVisit)\nNo. of ticket: \(rowData.quantity)\nPrice: $\(String(format: "%.2f", rowData.price))"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                self.purchaseList.list.remove(at: indexPath.row)
                FakeDatabase.shared.saveToDefault(self.defaults, self.currentUser!, self.purchaseList)
                let total = String(format: "%.2f", self.purchaseList.total)
                self.lblTotal.text = "Total Price: $\(total)"
                self.lblPurchasedNum.text = "No. of purchased ticket: \(self.purchaseList.list.count)"
                self.tvPurchaseList.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tvPurchaseList.dataSource = self
        self.tvPurchaseList.delegate = self
        self.currentUser = defaults.string(forKey: "CURRENT_LOGIN_USER")
        lblAccountInfo.text = "Account: \(self.currentUser!)"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        purchaseList = FakeDatabase.shared.getFromDefault(self.defaults, currentUser!)
        let total = String(format: "%.2f", purchaseList.total)
        lblTotal.text = "Total Price: $\(total)"
        lblPurchasedNum.text = "No. of purchased ticket: \(self.purchaseList.list.count)"
        tvPurchaseList.reloadData()
    }
    
    @objc private func logoutButtonTapped() {
        defaults.set(false, forKey: "logged")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(identifier: "LoginVC")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginVC)
    }

}
