//
//  NavigationService.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class NavigationService: NavigationServiceProtocol {
    
    private var window: UIWindow?
    
    func start() {
//        showSplashScreen()
        
        showMain()
    }
    
    func setup(with windowScene: UIWindowScene) -> UIWindow? {
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        return window
    }
    
    func showMain() {
        let imagesViewController = ImageListBuilder.build()
        let imagesNavigationController = EANavigationController(rootViewController: imagesViewController)
        imagesNavigationController.tabBarItem.title = R.string.localizable.image_listTabbarTitle()
        imagesNavigationController.tabBarItem.image = UIImage(systemName: "heart.fill")
        NavigationControllerDecorator.decorate(imagesNavigationController)
        
        let favouriteImagesViewController = FavouriteImagesListBuilder.build()
        let favouriteImagesNavigationController = EANavigationController(rootViewController: favouriteImagesViewController)
        favouriteImagesNavigationController.tabBarItem.title = R.string.localizable.image_favouriteTabbarTitle()
        favouriteImagesNavigationController.tabBarItem.image = UIImage(systemName: "doc.text.image")
        NavigationControllerDecorator.decorate(favouriteImagesNavigationController)
        
        let tabBarController = EATabBarController()
        tabBarController.viewControllers = [
            imagesNavigationController,
            favouriteImagesNavigationController
        ]
        TabBarControllerDecorator.decorate(tabBarController)
        
        setRoot(viewController: tabBarController)
    }
    
    private func showSplashScreen() {
        let viewController = SplashViewController()
        setRoot(viewController: viewController)
    }
    
    private func setRoot(viewController: UIViewController) {
        window?.rootViewController = viewController
        animateWindow()
    }
    
    private func animateWindow() {
        guard let window = window else { return }
        
        UIView.transition(
            with: window,
            duration: .default,
            options: .transitionCrossDissolve,
            animations: nil
        )
    }
    
}
