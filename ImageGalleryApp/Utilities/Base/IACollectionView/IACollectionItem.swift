//
//  IACollectionItem.swift
//  IndigoAnanas
//
//  Created by Alexander on 15.11.2022.
//

import Foundation

class IACollectionItem {
    
    enum Width {
        case `default`
        case custom(value: CGFloat)
    }
    
    var reuseID: String? { nil }
    var width: Width { .default }
    
}
