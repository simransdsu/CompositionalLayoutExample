//
//  ViewController.swift
//  CompositionalLayoutExample
//
//  Created by Simran Preet Narang on 2022-07-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Compositional Collection View"
        images = (1...20).compactMap { UIImage(named: "\($0)") }
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        // item
        
        // NOTE: Fractional Width of all these items should sum up to 1.0
        let item1 = CompositionalLayout.createItem(width: .fractionalWidth(0.2),
                                                  height: .fractionalHeight(1),
                                                  spacing: 2)
        
        let item2 = CompositionalLayout.createItem(width: .fractionalWidth(0.2),
                                                  height: .fractionalHeight(1),
                                                  spacing: 2)
        
        let item3 = CompositionalLayout.createItem(width: .fractionalWidth(0.6),
                                                   height: .fractionalHeight(1),
                                                   spacing: 2)
        
        // group
        let group = CompositionalLayout.createGroup(alignment: .horizontal,
                                                    width: .fractionalWidth(1),
                                                    height: .fractionalWidth(0.5),
                                                    subitems: [item1, item3, item2])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension ViewController: UICollectionViewDelegate {
    
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.setup(image: images[indexPath.row])
        return cell
    }
}


class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    func setup(image: UIImage) {
        imageView.image = image
    }
}
