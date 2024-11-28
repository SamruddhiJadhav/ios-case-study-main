//
//  ProductImageDetailsView.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class ProductImageDetailsView: UIView {
    private enum Constants {
        static let cornerRadius: CGFloat = 8
        static let fulfilmentTypeLabelBottomSpacing: CGFloat = 9
        static let spacingS: CGFloat = 16
        static let titleLabelBottomSpacing: CGFloat = 11
        static let imageDimention: CGFloat = 343
    }

    private lazy var productImage: DownloadableImageView = {
        let imageView = DownloadableImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .Details.title
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .largeBold
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var fulfilmentTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textLightGray
        label.font = .small
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
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
        addSubview(productImage)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(fulfilmentTypeLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: Constants.spacingS),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.spacingS),
            productImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacingS),
            productImage.heightAnchor.constraint(equalTo: productImage.widthAnchor),
            
            productImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -Constants.spacingS),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.spacingS),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacingS),
            
            titleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor , constant: -Constants.titleLabelBottomSpacing),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.spacingS),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacingS),
            
            priceLabel.bottomAnchor.constraint(equalTo: fulfilmentTypeLabel.topAnchor),
            fulfilmentTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -Constants.fulfilmentTypeLabelBottomSpacing),
            fulfilmentTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.spacingS),
            fulfilmentTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacingS),
        ])
    }
    
    func configure(_ viewModel: DealDetailsViewModel) {
        titleLabel.text = viewModel.productName
        priceLabel.attributedText = viewModel.dealDetails
        fulfilmentTypeLabel.text = viewModel.fulfillmentType
        productImage.image(
            for: viewModel.imageURL,
            size: CGSize(width: Constants.imageDimention, height: Constants.imageDimention)
        )
    }
}
