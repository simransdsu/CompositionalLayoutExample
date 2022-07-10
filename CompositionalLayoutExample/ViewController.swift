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
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        // adding spacing between each item
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        // group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.5)),
                                                       subitem: item,
                                                       count: 2)
        
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
