//
//  DealView.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class DealView: UIView {
    private enum Constants {
        static let cornerRadius: CGFloat = 8
        static let spacingXs: CGFloat = 8
        static let spacingS: CGFloat = 16
        static let imageDimention: CGFloat = 140
    }

    private lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .largeBold
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .medium
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private lazy var availabilityAndLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .textLightGray
        label.font = .small
        return label
    }()
    
    private lazy var labelConatiner: UIView = {
        let labelConatiner = UIView()
        labelConatiner.translatesAutoresizingMaskIntoConstraints = false
        return labelConatiner
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
        addSubview(labelConatiner)

        labelConatiner.addSubview(priceLabel)
        labelConatiner.addSubview(fulfilmentTypeLabel)
        labelConatiner.addSubview(titleLabel)
        labelConatiner.addSubview(availabilityAndLocationLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            productImage.heightAnchor.constraint(equalToConstant: Constants.imageDimention),
            productImage.widthAnchor.constraint(equalToConstant: Constants.imageDimention),
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: Constants.spacingS),
            productImage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -Constants.spacingS),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.spacingS),
            productImage.trailingAnchor.constraint(equalTo: labelConatiner.leadingAnchor, constant: -Constants.spacingS),
            
            labelConatiner.topAnchor.constraint(equalTo: topAnchor, constant: Constants.spacingS),
            labelConatiner.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -Constants.spacingS),
            labelConatiner.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacingS),
            
            priceLabel.topAnchor.constraint(equalTo: labelConatiner.topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: fulfilmentTypeLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: labelConatiner.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: labelConatiner.trailingAnchor),
            
            fulfilmentTypeLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor , constant: -Constants.spacingXs),
            fulfilmentTypeLabel.leadingAnchor.constraint(equalTo: labelConatiner.leadingAnchor),
            fulfilmentTypeLabel.trailingAnchor.constraint(equalTo: labelConatiner.trailingAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: availabilityAndLocationLabel.topAnchor , constant: -Constants.spacingXs),
            titleLabel.leadingAnchor.constraint(equalTo: labelConatiner.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: labelConatiner.trailingAnchor),
            
            availabilityAndLocationLabel.bottomAnchor.constraint(equalTo: labelConatiner.bottomAnchor, constant: -Constants.spacingXs),
            availabilityAndLocationLabel.leadingAnchor.constraint(equalTo: labelConatiner.leadingAnchor),
            availabilityAndLocationLabel.trailingAnchor.constraint(equalTo: labelConatiner.trailingAnchor),
        ])
    }
    
    func configure(_ viewModel: DealViewModel, _ imageProvider: ImageProviderProtocol) {
        availabilityAndLocationLabel.attributedText = viewModel.availabilityDetails
        titleLabel.text = viewModel.productName
        priceLabel.attributedText = viewModel.dealDetails
        fulfilmentTypeLabel.text = viewModel.fulfillmentType
        productImage.image(
            for: viewModel.imageURL,
            placeholder: UIImage(named: "placeholder"),
            imageProvider: imageProvider,
            size: CGSize(width: Constants.imageDimention, height: Constants.imageDimention)
        )
    }
}
