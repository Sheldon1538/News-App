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
        setupArticleImageAndTextElementsStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let articleNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        return label
    }()
    
    let articleDescription: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textAlignment = .left
         label.textColor = .white
         label.numberOfLines = 3
         label.font = UIFont.systemFont(ofSize: 16, weight: .light)
         return label
    }()
    
    let articleImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFill
         imageView.backgroundColor = .lightGray
         imageView.clipsToBounds = true
         imageView.layer.cornerRadius = 16.0
         return imageView
    }()
    
    let articleTextElementsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }()
    
    let articleImageAndTextElementsStackView: UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
         stackView.alignment = .center
        stackView.spacing = 16.0
         return stackView
    }()
    
    
    private func setupArticleTextElementsStackView() {
        articleTextElementsStackView.addArrangedSubview(articleNameLabel)
        articleTextElementsStackView.addArrangedSubview(articleDescription)
    }
    
    private func setupArticleImageAndTextElementsStackView() {
        contentView.addSubview(articleImageAndTextElementsStackView)
        articleImageAndTextElementsStackView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: .zero, left: 8.0, bottom: .zero, right: 8.0))
        articleImageAndTextElementsStackView.addArrangedSubview(articleImageView)
        
        articleImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        articleImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        articleImageAndTextElementsStackView.addArrangedSubview(articleTextElementsStackView)
        setupArticleTextElementsStackView()
    }
}
