//
//  ImageCollectionViewCell.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     var imageView: UIImageView = {
        let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFill
         imageView.backgroundColor = .lightGray
         imageView.clipsToBounds = true
         imageView.layer.cornerRadius = 16.0
         return imageView
    }()
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        imageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
}
