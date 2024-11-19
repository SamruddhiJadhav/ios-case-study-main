//
//  UIImageView+Extension.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 20/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

extension UIImageView {
  func image(
    for imageUrl: String,
    contentMode: ContentMode? = nil,
    placeholder: UIImage? = UIImage(named: "placeholder"),
    imageProvider: ImageProviderProtocol,
    size: CGSize,
    completion: (() -> Void)? = nil
  ) {
      clipsToBounds = true
      self.contentMode = .center
      placeholderFallback(placeholder)

      if let downloadableImageUrl = URL(string: imageUrl) {
          imageProvider.loadImage(from: downloadableImageUrl, resizeTo: size) { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
          }
      }
   }
}

private extension UIImageView {
    func placeholderFallback(_ placeholder: UIImage?) {
        contentMode = .center
        image = placeholder
    }
}
