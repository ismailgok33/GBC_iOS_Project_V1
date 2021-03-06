
import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "activityCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ActivityCollectionViewCell", bundle: nil)
    }
    
    func configureUI(activity: Activity) {
        self.imageView.image = activity.photo
        self.name.text = activity.name
        self.price.text = "Price: $\(activity.price) / person"
        backgroundColor = activity.isPopular ? .systemYellow : .white
    }

}
