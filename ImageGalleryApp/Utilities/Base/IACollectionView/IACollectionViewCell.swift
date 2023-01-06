//
//  IACollectionViewCell.swift
//  IndigoAnanas
//
//  Created by Alexander on 15.11.2022.
//

import UIKit

class IACollectionViewCell: UICollectionViewCell {
    // MARK: - Props
    var _viewModel: Any? {
        didSet { updateComponents() }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupComponents()
    }

    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()

        setupComponents()
    }

    // MARK: - IAViewProtocol
    func setupComponents() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    func updateComponents() {}
}
