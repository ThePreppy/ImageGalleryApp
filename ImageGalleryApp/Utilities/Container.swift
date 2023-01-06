//
//  Container.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

enum Container {
    
    static func setup() {
        let navigationService = NavigationService()
        ServiceLocator.shared.add(service: navigationService)
        
        let dataBaseManager = DatabaseManager.shared
        ServiceLocator.shared.add(service: dataBaseManager)
    }
    
    static var navigationService: NavigationServiceProtocol {
        guard let navigationService: NavigationService = ServiceLocator.shared.getService() else {
            fatalError("NavigationService should be implement using ServiceLocator")
        }
        
        return navigationService
    }
    
    static var dataBaseManager: DatabaseManagerProtocol {
        guard let navigationService: DatabaseManager = ServiceLocator.shared.getService() else {
            fatalError("DatabaseManager should be implement using ServiceLocator")
        }
        
        return navigationService
    }
    
}
