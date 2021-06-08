//
//  ArticleDescriptionCollectionViewCell.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

class ArticleDescriptionCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupArticleNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let articleDescriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private func setupArticleNameLabel() {
        contentView.addSubview(articleDescriptionLabel)
        articleDescriptionLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
}
