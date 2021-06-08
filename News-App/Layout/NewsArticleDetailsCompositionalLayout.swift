//
//  NewsArticleDetailsCompositionalLayout.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

final class NewsArticleDetailsCompositionalLayout {
    
    static func createLayout(section: NewsArticleDetailsSection) -> NSCollectionLayoutSection {
        switch section {
        case .image:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        case .title:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = 16.0
            section.contentInsets.trailing = 16.0
            section.contentInsets.top = 32.0
            return section
        case .description:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = 16.0
            section.contentInsets.trailing = 16.0
            section.contentInsets.top = 32.0
            return section
        }
    }
    
}

enum NewsArticleDetailsSection {
    case image
    case title
    case description
}
