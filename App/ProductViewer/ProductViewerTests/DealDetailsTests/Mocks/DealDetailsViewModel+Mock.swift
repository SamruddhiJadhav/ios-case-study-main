//
//  DealDetailsViewModel+Mock.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

@testable import ProductViewer
import Foundation

extension DealDetailsViewModel {
    static func mock(
        dealDetails: NSAttributedString = NSAttributedString(""),
        fulfillmentType: String = "",
        productName: String = "",
        description: String = "",
        imageURL: String = ""
    ) -> DealDetailsViewModel {
        return DealDetailsViewModel(
            dealDetails: dealDetails,
            fulfillmentType: fulfillmentType,
            productName: productName,
            description: description,
            imageURL: imageURL
        )
    }
}
