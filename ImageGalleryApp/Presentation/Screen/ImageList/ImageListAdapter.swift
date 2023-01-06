//
//  ImageListAdapter.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

class ImageListAdapter: IACollectionViewAdapter {
    
    var didReachEnd: Closure?
    var didSelectItem: DataClosure<IndexPath>?
    var prefetchItemsAt: DataClosure<[IndexPath]>?
    
}

extension ImageListAdapter {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.hasReachEnd else {
            return
        }
        
        didReachEnd?()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
       
        didSelectItem?(indexPath)
    }
    
}

extension ImageListAdapter: UICollectionViewDataSourcePrefetching {
    
    func collectionView(
        _ collectionView: UICollectionView,
        prefetchItemsAt indexPaths: [IndexPath]
    ) {
        
        prefetchItemsAt?(indexPaths)
    }
    
}
