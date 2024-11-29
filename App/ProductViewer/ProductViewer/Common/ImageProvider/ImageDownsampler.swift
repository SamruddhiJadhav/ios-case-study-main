//
//  ImageDownsampler.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 28/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

struct ImageDownsampler {
    static func resizeImage(data: CFData, for size: CGSize) -> UIImage? {
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height)
        ]

        guard let imageSource = CGImageSourceCreateWithData(data, nil),
            let scaledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary)
        else {
            return nil
        }

        return UIImage(cgImage: scaledImage)
    }
}
