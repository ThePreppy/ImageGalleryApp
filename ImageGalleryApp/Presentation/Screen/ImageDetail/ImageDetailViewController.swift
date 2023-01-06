//
//  ImageDetailViewController.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import UIKit
import Kingfisher

class ImageDetailViewController: EAViewController {
    
    private lazy var imageView: UIView = {
        let result = UIImageView()
        result.tintColor = AppTheme.black
        result.setImage(
            url: viewModel.image.downloadURL,
            shouldDownsample: false
        )
        
        return result
    }()
    
    private lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.font = .systemFont(ofSize: 26)
        result.textColor = AppTheme.systemBlack
        result.text = viewModel.image.author
        
        return result
    }()
    
    private lazy var resolutionLabel: UILabel = {
        let result = UILabel()
        result.font = .systemFont(ofSize: 16)
        result.textColor = AppTheme.systemBlack
        result.text = R.string.localizable.image_detailResolution() + ": \(viewModel.image.height)x\(viewModel.image.width)"
        
        return result
    }()
    
    let viewModel: ImageDetailViewModelInput
    
    init(viewModel: ImageDetailViewModelInput) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = R.string.localizable.image_detailNavigationTitle()
        
        let infoStackView = UIStackView.vertical(
            spacing: 6,
            arrangedSubviews: [
                titleLabel,
                resolutionLabel
            ]
        )
        infoStackView.insets = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        let stackView = UIStackView.vertical(
            spacing: 12,
            alignment: .leading,
            arrangedSubviews: [
                imageView,
                infoStackView
            ]
        )
        
        stackView.addToSuperview(view) {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide)
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
    }
    
}
