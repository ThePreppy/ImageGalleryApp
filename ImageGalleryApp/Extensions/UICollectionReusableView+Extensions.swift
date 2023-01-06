//
//  UICollectionReusableView+Extensions.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

extension UICollectionReusableView {
    
    static var reuseID: String {
        String(describing: Self.self)
    }
    
}
