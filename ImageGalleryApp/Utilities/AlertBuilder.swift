//
//  AlertBuilder.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

class AlertBuilder {
    
    struct Action {
        let title: String
        let style: UIAlertAction.Style
        var handler: Closure? = nil
        
        static func ok(handler: Closure? = nil) -> Self {
            Action(
                title: R.string.localizable.commonOk(),
                style: .default,
                handler: handler
            )
        }
    }
    
    private var title: String = R.string.localizable.commonWarning()
    private var message: String? = nil
    private var style: UIAlertController.Style = .alert
    private var actions: [UIAlertAction] = []
    
    func title(_ value: String) -> Self {
        title = value
        
        return self
    }
    
    func message(_ value: String) -> Self {
        message = value
        
        return self
    }
    
    func style(_ value: UIAlertController.Style) -> Self {
        style = value
        
        return self
    }
    
    func addAction(_ value: Action) -> Self {
        let action = UIAlertAction(title: value.title, style: value.style) { _ in
            value.handler?()
        }
        actions.append(action)
        
        return self
    }
    
    func build() -> UIAlertController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        actions.forEach(alertViewController.addAction)
        
        return alertViewController
    }
    
}
