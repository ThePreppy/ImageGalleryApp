//
//  SceneDelegate.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {

        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        let navigationService = Container.navigationService
        window = navigationService.setup(with: windowScene)
        navigationService.start()
    }

}

