//
//  ImageListType.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import Foundation

enum ImageListType {
    case all
    case favourites
    
    var title: String {
        switch self {
        case .all:
            return R.string.localizable.image_listNavigationTitle()
        case .favourites:
            return R.string.localizable.image_favouriteNavigationTitle()
        }
    }
}
