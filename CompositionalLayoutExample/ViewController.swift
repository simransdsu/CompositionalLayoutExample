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
