//
//  NewsArticleCollectionViewCell.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

class NewsArticleCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupArticleNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let articleNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .black)
        return label
    }()
    
    private func setupArticleNameLabel() {
        contentView.addSubview(articleNameLabel)
        articleNameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 8.0, left: 8.0, bottom: .zero, right: 8.0))
    }
}
