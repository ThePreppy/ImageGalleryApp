//
//  NavigationServiceProtocol.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

protocol NavigationServiceProtocol {
    
    func start()
    func setup(with windowScene: UIWindowScene) -> UIWindow?
    func showMain()
    
}
