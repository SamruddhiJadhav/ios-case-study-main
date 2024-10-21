//
//  DealDetailsView.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class ProductDetailsScrollView: UIScrollView {
    private enum Constants {
        static let spacingS: CGFloat = 16
    }

    private lazy var mainConatiner: UIView = {
        let conatiner = UIView()
        conatiner.translatesAutoresizingMaskIntoConstraints = false
        return conatiner
    }()
    
    private lazy var productDescriptionView: ProductDescriptionView = {
        let conatiner = ProductDescriptionView()
        conatiner.translatesAutoresizingMaskIntoConstraints = false
        return conatiner
    }()
    
    private lazy var productView: ProductImageDetailsView = {
        let conatiner = ProductImageDetailsView()
        conatiner.translatesAutoresizingMaskIntoConstraints = false
        return conatiner
    }()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        isScrollEnabled = true

        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        addSubview(mainConatiner)
        mainConatiner.addSubview(productView)
        mainConatiner.addSubview(productDescriptionView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainConatiner.widthAnchor.constraint(equalTo: widthAnchor),
            
            mainConatiner.topAnchor.constraint(equalTo: topAnchor),
            mainConatiner.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainConatiner.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainConatiner.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            productView.topAnchor.constraint(equalTo: mainConatiner.topAnchor),
            productView.trailingAnchor.constraint(equalTo: mainConatiner.trailingAnchor),
            productView.leadingAnchor.constraint(equalTo: mainConatiner.leadingAnchor),
            productView.bottomAnchor.constraint(equalTo: productDescriptionView.topAnchor, constant: -Constants.spacingS),

            productDescriptionView.trailingAnchor.constraint(equalTo: mainConatiner.trailingAnchor),
            productDescriptionView.leadingAnchor.constraint(equalTo: mainConatiner.leadingAnchor),
            productDescriptionView.bottomAnchor.constraint(equalTo: mainConatiner.bottomAnchor),
        ])
    }
    
    func configure(_ viewModel: DealDetailsViewModel, _ imageProvider: ImageProviderProtocol) {
        productView.configure(viewModel, imageProvider)
        productDescriptionView.configure(viewModel)
        backgroundColor = .grayLight
    }
}
