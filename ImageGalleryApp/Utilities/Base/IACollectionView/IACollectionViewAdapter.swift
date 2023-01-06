//
//  IACollectionViewDataAdapter.swift
//  IndigoAnanas
//
//  Created by Alexander on 15.11.2022.
//

import UIKit

class IACollectionViewAdapter: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var sections: [IACollectionSection] = []
    
    func removeItem(at indexPath: IndexPath) {
        sections[safe: indexPath.section]?.items.remove(at: indexPath.item)
    }
    
    func getItem<T: IACollectionItem>(at indexPath: IndexPath) -> T? {
        sections[safe: indexPath.section]?.items[safe: indexPath.item] as? T
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[safe: section]?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let item = sections[safe: indexPath.section]?.getItem(at: indexPath),
            let cellID = item.reuseID,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? IACollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell._viewModel = item
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let currentSection = sections[safe: indexPath.section]
        let model = kind == UICollectionView.elementKindSectionHeader ? currentSection?.header : currentSection?.footer
        
        guard let identifier = model?.reuseID else {
            return UICollectionReusableView()
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: identifier,
            for: indexPath
        ) as? IACollectionHeaderFooter
        
        headerView?._viewModel = model
        
        return headerView ?? UICollectionReusableView()
    }
    
}
