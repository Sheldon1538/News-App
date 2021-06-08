//
//  ArticleNameCollectionViewCell.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

class ArticleNameCollectionViewCell: UICollectionViewCell {
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
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        return label
    }()
    
    private func setupArticleNameLabel() {
        contentView.addSubview(articleNameLabel)
        articleNameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
}
