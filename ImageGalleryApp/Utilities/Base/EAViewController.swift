//
//  EAViewController.swift
//  ImageGalleryApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class EAViewController: UIViewController {
    
    private let loaderView = LoaderView()
    
    init() {
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
    }
    
    func setupComponents() {
        view.backgroundColor = AppTheme.systemWhite
    }
    
}

extension EAViewController: ErrorRepresentable {
    
    func handle(error: Error?) {
        guard let error = error else {
            return
        }
        
        let alertViewController = AlertBuilder()
            .message(error.localizedDescription)
            .addAction(.ok())
            .build()
        
        present(alertViewController, animated: true)
    }
    
}

extension EAViewController: LoaderRepresentable {
    
    func startLoading() {
        loaderView.addToSuperview(view) {
            $0.edges.equalToSuperview()
        }
    }
    
    func stopLoading() {
        loaderView.removeFromSuperview()
    }
    
}
