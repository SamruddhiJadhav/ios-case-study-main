//
//  UINavigationBar+Extension.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 20/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let borderView = UIView()
        borderView.backgroundColor = color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(borderView)
        
        NSLayoutConstraint.activate([
            borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            borderView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
