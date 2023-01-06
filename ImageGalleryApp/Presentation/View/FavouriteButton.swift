//
//  FavouriteButton.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit

class FavouriteButton: EAButton {
    
    override var isSelected: Bool {
        didSet { handleSelected() }
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        setImage(UIImage(systemName: "heart"), for: .normal)
        setImage(UIImage(systemName: "heart.fill"), for: .selected)
        handleSelected()
    }
    
    private func handleSelected() {
        tintColor = isSelected ? AppTheme.primary : AppTheme.grey
    }
    
}
