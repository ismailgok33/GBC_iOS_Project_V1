//
//  ActivitiesViewController.swift
//  Project
//
//  Created by İsmail on 30.03.2022.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet var collectionView: UICollectionView!
    
    var activities: [Activity] = []

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.title = "Things to do in Paris"
        
        fetchAllActivities()
        
        configureCollectionView()
    }
    
    // MARK: - Helpers
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ActivityCollectionViewCell.nib(), forCellWithReuseIdentifier: ActivityCollectionViewCell.reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        
        collectionView.collectionViewLayout = layout

    }
    
    func fetchAllActivities() {
        self.activities = FakeDatabase.shared.getAllActivities()
    }

}

// MARK: - CollectionView Delegate and Datasource

extension ActivitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCollectionViewCell.reuseIdentifier, for: indexPath) as! ActivityCollectionViewCell
        
        cell.configureUI(activity: activities[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        collectionView.deselectItem(at: indexPath, animated: true)
                
        guard let activityDetailVC = storyboard?.instantiateViewController(withIdentifier: "ActivityDetailVC") as? ActivityDetailViewController else {
            print("DEBUG: Error while pushing activityDetailVC")
            return
        }
        
        self.navigationController?.pushViewController(activityDetailVC, animated: true)
        
        
    }
}

// MARK: - CollectionView Flow layout

extension ActivitiesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 40, height: (UIScreen.main.bounds.width / 2) - 40)
    }
}
