//
//  UIView+Extensions.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit
import SnapKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get { layer.borderColor.map { UIColor(cgColor: $0) } }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    func round() {
        let value = min(frame.height, frame.width)
        
        cornerRadius = value / 2
    }
    
    func addToSuperview(_ superview: UIView, makeConstraints: DataClosure<ConstraintMaker>) {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        
        snp.makeConstraints(makeConstraints)
    }
    
}
