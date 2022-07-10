//
//  ComositionalLayout.swift
//  CompositionalLayoutExample
//
//  Created by Simran Preet Narang on 2022-07-10.
//

import Foundation
import UIKit

enum GroupAlignment {
    case horizontal
    case vertical
}


struct CompositionalLayout {
    
    static func createItem(width: NSCollectionLayoutDimension,
                           height: NSCollectionLayoutDimension,
                           spacing: CGFloat) -> NSCollectionLayoutItem {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: width,
                                                            heightDimension: height))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        return item
    }
    
    
    
    static func createGroup(alignment: GroupAlignment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            subitems: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        switch alignment {
            case .horizontal:
                return NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: width, heightDimension: height),
                    subitems: subitems)
            case .vertical:
                return NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(widthDimension: width, heightDimension: height),
                    subitems: subitems)
        }
    }
    
    
    static func createGroup(alignment: GroupAlignment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            subitem: NSCollectionLayoutItem,
                            count: Int) -> NSCollectionLayoutGroup {
        switch alignment {
            case .horizontal:
                return NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: width, heightDimension: height),
                    subitem: subitem,
                    count: count)
            case .vertical:
                return NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(widthDimension: width, heightDimension: height),
                    subitem: subitem,
                    count: count)
        }
    }
}
