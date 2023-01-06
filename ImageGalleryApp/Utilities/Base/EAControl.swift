//
//  EAControl.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class EAControl: UIControl {
    
    var didTap: Closure?
    
    override var isHighlighted: Bool {
        didSet { handleHighlighted() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupComponents()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        isHighlighted = true
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        isHighlighted = false
        didTap?()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        isHighlighted = false
    }
    
    func setupComponents() {
        
    }
    
    func updateComponents() {
        
    }
    
    private func handleHighlighted() {
        guard didTap != nil else { return }
        
        UIView.animate(withDuration: .fast, delay: isHighlighted ? 0.1 : 0) {
            self.alpha = self.isHighlighted ? 0.6 : 1
        }
    }
    
}
