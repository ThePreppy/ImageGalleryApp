//
//  TabBarControllerDecorator.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

struct TabBarControllerDecorator {
    
    static func decorate(_ tabBarController: UITabBarController) {
        let tabBar = tabBarController.tabBar
        let appearance = tabBar.standardAppearance
        let titleColor: UIColor = AppTheme.white
        
        appearance.backgroundColor = AppTheme.primary
        
        tabBar.tintColor = titleColor
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
}
