//
//  IACollectionSection.swift
//  IndigoAnanas
//
//  Created by Alexander on 15.11.2022.
//

import Foundation

class IACollectionSection {
    var items: [IACollectionItem]
    var header: IACollectionHeaderFooterItem? = nil
    var footer: IACollectionHeaderFooterItem? = nil
    
    var numberOfItems: Int {
        items.count
    }
    
    func getItem(at indexPath: IndexPath) -> IACollectionItem? {
        items[safe: indexPath.row]
    }
    
    init(items: [IACollectionItem], header: IACollectionHeaderFooterItem? = nil, footer: IACollectionHeaderFooterItem? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
    }
}
