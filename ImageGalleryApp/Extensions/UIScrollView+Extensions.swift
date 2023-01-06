//
//  UIScrollView+Extensions.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

extension UIScrollView {
    
    var hasReachEnd: Bool {
        let offsetY = contentOffset.y
        let contentHeight = contentSize.height
        let boundsHeight = bounds.size.height
        
        return offsetY >= contentHeight - boundsHeight
    }
    
}
