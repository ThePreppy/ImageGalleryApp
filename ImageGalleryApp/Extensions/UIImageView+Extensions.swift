//
//  UIImageView+Extensions.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(url: URL?, shouldDownsample: Bool = true) {
        guard let url else {
            image = R.image.no_imagePlaceholderIc()
            return
        }
        
        var options: KingfisherOptionsInfo {
            var result: KingfisherOptionsInfo = [
                .cacheOriginalImage,
                .fromMemoryCacheOrRefresh,
                .backgroundDecode
            ]
            
            if shouldDownsample {
                let processor = DownsamplingImageProcessor(size: .init(width: 300, height: 300))
                result.append(.processor(processor))
            }
            
            return result
        }
        
        kf.setImage(
            with: url,
            placeholder: R.image.no_imagePlaceholderIc(),
            options: options
        )
    }
    
}
