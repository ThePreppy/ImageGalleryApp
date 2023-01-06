//
//  IACollectionHeaderFooter.swift
//  IndigoAnanas
//
//  Created by Alexander on 18.11.2022.
//

import UIKit

class IACollectionHeaderFooter: UICollectionReusableView {
    
    var _viewModel: Any? {
        didSet { updateComponents() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupComponents()
    }
    
    func setupComponents() {
        
    }
    
    func updateComponents() {
        
    }
    
}
