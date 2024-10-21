//
//  ImageProviderProtocol.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 20/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import SDWebImage
import UIKit

protocol ImageProviderProtocol {
    func loadImage(from url: URL, resizeTo size: CGSize?, completion: @escaping (UIImage?) -> Void)
}

final class ImageProvider: ImageProviderProtocol {
    private let imageManager: SDWebImageManager
    
    init(imageManager: SDWebImageManager = SDWebImageManager.shared) {
        self.imageManager = imageManager
    }

    func loadImage(from url: URL, resizeTo size: CGSize? = nil, completion: @escaping (UIImage?) -> Void) {
        imageManager.loadImage(with: url, options: .highPriority, progress: nil) { image, _, _, _, _, _ in
            if let size = size, let image = image {
                let resizedImage = self.resizeImage(image: image, targetSize: size)
                completion(resizedImage)
            } else {
                completion(image)
            }
        }
    }
}

private extension ImageProvider {
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        let scaleFactor = min(widthRatio, heightRatio)

        let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
