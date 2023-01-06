//
//  IACollectionHeaderFooterView.swift
//  IndigoAnanas
//
//  Created by Alexander on 18.11.2022.
//

import Foundation

class IACollectionHeaderFooterView<Model>: IACollectionHeaderFooter {
 
    var viewModel: Model? {
        get { _viewModel as? Model }
        set { _viewModel = newValue }
    }
    
}
