//
//  EAButton.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class EAButton: UIButton {
    
    var didTap: Closure? {
        didSet { addTarget(self, action: #selector(handleDidTap), for: .touchUpInside) }
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
    
    @objc
    private func handleDidTap() {
        didTap?()
    }
    
}
