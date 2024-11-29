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
    func cancelCurrentImageLoad()
}

final class ImageProvider: ImageProviderProtocol {
    private var currentDownloadOperation: SDWebImageCombinedOperation?
    private let imageManager: SDWebImageManager
    
    init(imageManager: SDWebImageManager = SDWebImageManager.shared) {
        self.imageManager = imageManager
    }

    func loadImage(from url: URL, resizeTo size: CGSize? = nil, completion: @escaping (UIImage?) -> Void) {
        cancelCurrentImageLoad()
        currentDownloadOperation = imageManager.loadImage(with: url, options: .highPriority, progress: nil) { image, _, _, _, _, _ in
            if let size = size, let imageData = image?.sd_imageData() {
                let resizedImage = ImageDownsampler.resizeImage(data: NSData(data: imageData), for: size)
                completion(resizedImage)
            } else {
                completion(image)
            }
        }
    }
    
    func cancelCurrentImageLoad() {
        currentDownloadOperation?.cancel()
    }
}
