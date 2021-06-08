//
//  UICollectionViewCell + Identifier.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

extension UICollectionViewCell {
    
    static var cellId: String {
        String(describing: self)
    }
    
}
