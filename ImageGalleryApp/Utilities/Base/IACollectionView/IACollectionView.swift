//
//  IACollectionView.swift
//  IndigoAnanas
//
//  Created by Alexander on 15.11.2022.
//

import UIKit

class IACollectionView: UICollectionView {
    
    weak var adapter: IACollectionViewAdapter? {
        didSet {
            dataSource = adapter
            delegate = adapter
        }
    }
    
    init(scrollDirection: ScrollDirection = .vertical) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        super.init(frame: .zero, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
