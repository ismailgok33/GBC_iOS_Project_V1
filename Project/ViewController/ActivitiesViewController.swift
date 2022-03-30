//
//  ActivitiesViewController.swift
//  Project
//
//  Created by İsmail on 30.03.2022.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ActivityCollectionViewCell.nib(), forCellWithReuseIdentifier: ActivityCollectionViewCell.reuseIdentifier)

        view.backgroundColor = .red
    }
    
    func configureCollectionView() {
        
    }

}

// MARK: - CollectionView Delegate and Datasource
extension ActivitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCollectionViewCell.reuseIdentifier, for: indexPath) as! ActivityCollectionViewCell
        
        cell.imageView = UIImageView(image: UIImage(systemName: "book"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("DEBUG: tapped on collection view cell")
    }
}

// MARK: - CollectionView Flow layout
extension ActivitiesViewController: UICollectionViewDelegateFlowLayout {
    
}
