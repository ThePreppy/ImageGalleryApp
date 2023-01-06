//
//  IACollectionItemCell.swift
//  IndigoAnanas
//
//  Created by Alexander on 15.11.2022.
//

import Foundation

class IACollectionItemCell<Model: IACollectionItem>: IACollectionViewCell {
    
    var viewModel: Model? {
        get { _viewModel as? Model }
        set { _viewModel = newValue }
    }
    
}
