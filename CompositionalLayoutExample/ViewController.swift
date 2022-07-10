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
        
        // 2 images one below other
        let itemForVerticalGroup = CompositionalLayout.createItem(width: .fractionalWidth(1),
                                                                  height: .fractionalHeight(1),
                                                                  spacing: 2)
        let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical,
                                                            width: .fractionalWidth(0.5),
                                                            height: .fractionalHeight(1.0),
                                                           subitem: itemForVerticalGroup,
                                                           count: 2)
        
        // 1 image taking height of 2 images above
        let item = CompositionalLayout.createItem(width: .fractionalWidth(0.5),
                                                  height: .fractionalHeight(1),
                                                  spacing: 2)
        let horizontalGroup = CompositionalLayout.createGroup(alignment: .horizontal,
                                                    width: .fractionalWidth(1),
                                                    height: .absolute(400),
                                                    subitems: [verticalGroup, item])
        
        
        let mainItem = CompositionalLayout.createItem(width: .fractionalWidth(1),
                                                           height: .absolute(100),
                                                           spacing: 1)
        let mainGroup = CompositionalLayout.createGroup(alignment: .vertical,
                                                             width: .fractionalWidth(1),
                                                             height: .absolute(500),
                                                             subitems: [mainItem, horizontalGroup])
        
        // section
        let section = NSCollectionLayoutSection(group: mainGroup)
        
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
