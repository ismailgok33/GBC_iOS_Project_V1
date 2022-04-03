// MARK: - KACHUN
import UIKit

class PurchaseTicketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvPurchaseList: UITableView!
    @IBOutlet weak var lblTotal: UILabel!
        
    let defaults = UserDefaults.standard
    var purchaseList = PurchaseList()
    var CURRENT_USER: String? = nil
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseList.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowData = purchaseList.list[indexPath.row]
        let cell = tvPurchaseList.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "Name: \(rowData.name)"
        content.secondaryText = "Date: \(rowData.dateOfVisit)\nNumber. of participant: \(rowData.quantity)\nPrice: \(rowData.price)"
       
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            purchaseList.list.remove(at: indexPath.row)
            FakeDatabase.shared.saveToDefault(defaults: defaults, username: CURRENT_USER!, purchaseList: purchaseList)
            
            let total = String(format: "%.2f", FakeDatabase.shared.countTotal(list: purchaseList.list))
            lblTotal.text = "Total Price: $\(total)"
            tvPurchaseList.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(purchaseList.list.count)
        
        self.tvPurchaseList.dataSource = self
        self.tvPurchaseList.delegate = self
        self.CURRENT_USER = defaults.string(forKey: "CURRENT_LOGIN_USER")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        purchaseList = FakeDatabase.shared.getFromDefault(defaults: self.defaults, username: CURRENT_USER!)
        let total = String(format: "%.2f", FakeDatabase.shared.countTotal(list: purchaseList.list))
        lblTotal.text = "Total Price: $\(total)"
        tvPurchaseList.reloadData()
    }

}
//KACHUN
