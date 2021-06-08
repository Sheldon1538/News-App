//
//  NewsCompositionalLayout.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

final class NewsCompositionalLayout {
    
    var layout: UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)), subitems: [item])
        group.contentInsets.bottom = 16.0
        let section = NSCollectionLayoutSection(group: group)
        let compLayout = UICollectionViewCompositionalLayout(section: section)
        return compLayout
    }
    
}
