//
//  ImageCollectionCell.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

class ImageCollectionCell: IACollectionItemCell<ImageCollectionCell.Model> {
    
    class Model: IACollectionItem {
        let url: URL?
        var isFavourite: Bool
        var didFavourite: Closure?
        
        override var reuseID: String? {
            ImageCollectionCell.reuseID
        }
        
        init(url: URL?, isFavourite: Bool, didFavorite: Closure?) {
            self.url = url
            self.isFavourite = isFavourite
            self.didFavourite = didFavorite
        }
    }
    
    private lazy var imageView: UIImageView = {
        let result = UIImageView()
        result.tintColor = AppTheme.black
        
        return result
    }()
    
    private lazy var favouriteButton: FavouriteButton = {
        let result = FavouriteButton()
        result.didTap = { [weak self] in
            self?.viewModel?.didFavourite?()
        }
        
        return result
    }()
    
    override var isHighlighted: Bool {
        didSet { animate() }
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        imageView.addToSuperview(contentView) {
            $0.edges.equalToSuperview()
        }
        
        favouriteButton.addToSuperview(contentView) {
            $0.top.trailing.equalToSuperview().inset(6)
            $0.size.equalTo(30)
        }
        
    }
    
    override func updateComponents() {
        super.updateComponents()
     
        imageView.setImage(url: viewModel?.url)
        favouriteButton.isSelected = viewModel?.isFavourite == true
    }
    
    private func animate() {
        UIView.animate(
            withDuration: 0.1,
            delay: isHighlighted ? 0.1 : 0,
            options: [.curveEaseOut],
            animations: {
                self.alpha = self.isHighlighted ? 0.9 : 1.0
                self.transform = self.isHighlighted ?
                CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9) :
                CGAffineTransform.identity
            }
        )
    }
    
}
