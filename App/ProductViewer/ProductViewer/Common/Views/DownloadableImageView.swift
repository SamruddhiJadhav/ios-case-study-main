//
//  DownloadableImageView.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 28/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit
import SDWebImage

final class DownloadableImageView: UIImageView {
    private let imageProvider: ImageProviderProtocol

    init(_ imageProvider: ImageProviderProtocol = ImageProvider()) {
        self.imageProvider = imageProvider
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func image(
      for imageUrl: String,
      contentMode: ContentMode? = nil,
      placeholder: UIImage? = UIImage(named: "placeholder"),
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
      
      func cancelDownload() {
          imageProvider.cancelCurrentImageLoad()
      }
}

private extension DownloadableImageView {
    func placeholderFallback(_ placeholder: UIImage?) {
        contentMode = .center
        image = placeholder
    }
}
