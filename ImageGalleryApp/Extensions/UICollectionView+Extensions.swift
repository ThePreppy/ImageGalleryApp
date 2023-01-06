//
//  UICollectionView+Extensions.swift
//  IndigoAnanas
//
//  Created by Alexander on 15.11.2022.
//

import UIKit

extension UICollectionView {
    
    func registerCell(_ value: AnyClass) {
        register(value, forCellWithReuseIdentifier: String(describing: value.self))
    }
    
    func registerCells(_ values: AnyClass...) {
        values.forEach(registerCell(_:))
    }
    
    func registerHeader(_ value: AnyClass) {
        register(
            value,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: value.self)
        )
    }
    
    func registerHeaders(_ values: AnyClass...) {
        values.forEach(registerHeader(_:))
    }
    
    func registerFooter(_ value: AnyClass) {
        register(
            value,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: String(describing: value.self)
        )
    }
    
    func registerFooters(_ values: AnyClass...) {
        values.forEach(registerFooter(_:))
    }
    
}
