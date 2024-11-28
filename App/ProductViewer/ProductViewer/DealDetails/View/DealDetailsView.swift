//
//  DealDetailsView.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class DealDetailsView: UIView {
    private enum Constants {
        static let spacingS: CGFloat = 16
        static let spacingM: CGFloat = 32
        static let scrollViewBottomMargin: CGFloat = 72
        static let buttonHeight: CGFloat = 44
        static let radius: CGFloat = 6
        static let containerCornerRadius: CGFloat = 12
        static let shadowOpacity: Float = 0.2
        static let shadowOffsetHeight: CGFloat = 3
    }

    private lazy var scrollView: ProductDetailsScrollView = {
        let scrollView = ProductDetailsScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .redDarkest
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Constants.radius
        return button
    }()
    
    private lazy var buttonConatiner: UIView = {
        let conatiner = UIView()
        conatiner.backgroundColor = .white
        conatiner.translatesAutoresizingMaskIntoConstraints = false
        conatiner.layer.cornerRadius = Constants.containerCornerRadius
        conatiner.layer.shadowColor = UIColor.black.cgColor
        conatiner.layer.shadowOpacity = Constants.shadowOpacity
        conatiner.layer.shadowOffset = CGSize(width: 0, height: Constants.shadowOffsetHeight)
        conatiner.layer.shadowRadius = Constants.radius
        conatiner.isHidden = true
        
        return conatiner
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
        addSubview(scrollView)
        addSubview(buttonConatiner)
        
        buttonConatiner.addSubview(addToCartButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.scrollViewBottomMargin),
            
            buttonConatiner.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonConatiner.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonConatiner.bottomAnchor.constraint(equalTo: bottomAnchor),
            addToCartButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
        ])
        addToCartButton.pinToSuperView(
            topPadding: Constants.spacingS,
            leadingPadding: Constants.spacingS,
            trailingPadding: Constants.spacingS,
            bottomPadding: Constants.spacingM
        )
    }
    
    func configure(_ viewModel: DealDetailsViewModel) {
        scrollView.configure(viewModel)
        buttonConatiner.isHidden = false
    }
}
