//
//  ProductDescriptionView.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class ProductDescriptionView: UIView {
    private enum Constants {
        static let spacingS: CGFloat = 16
        static let titleBottomSpacing: CGFloat = 10
    }
    
    private lazy var productDetailsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .medium
        label.textColor = .black
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private lazy var productDetailsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .Details.copy2
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .vertical)
        label.textColor = .grayMedium
        return label
    }()

    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white

        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        addSubview(productDetailsTitle)
        addSubview(productDetailsDescriptionLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            productDetailsTitle.topAnchor.constraint(equalTo: topAnchor, constant: Constants.spacingS),
            productDetailsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.spacingS),
            productDetailsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacingS),
            productDetailsTitle.bottomAnchor.constraint(equalTo: productDetailsDescriptionLabel.topAnchor, constant: -Constants.titleBottomSpacing),

            productDetailsDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.spacingS),
            productDetailsDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacingS),
            productDetailsDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.spacingS)
        ])
    }
    
    func configure(_ viewModel: DealDetailsViewModel) {
        productDetailsDescriptionLabel.text = viewModel.description
        productDetailsTitle.text = "Product Details"
    }
}
