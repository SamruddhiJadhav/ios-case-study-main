//
//  DealDetails+Mock.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

@testable import ProductViewer

extension DealDetails {
    static func mock(
        id: Int = 1,
        title: String = "",
        aisle: String = "",
        description: String = "",
        imageURL: String = "",
        regularPriceAmountInCents: Int = 0,
        salePriceAmountInCents: Int = 0,
        currencySymbol: String = "",
        regularPriceDisplayString: String = "",
        salePriceDisplayString: String = "",
        availability: String = "",
        fulfillment: String = ""
    ) -> DealDetails {
        return DealDetails(
            id: id,
            title: title,
            aisle: aisle,
            description: description,
            imageURL: imageURL,
            regularPrice: DealDetailsPrice(
                amountInCents: regularPriceAmountInCents,
                currencySymbol: currencySymbol,
                displayString: regularPriceDisplayString
            ),
            salePrice: DealDetailsPrice(
                amountInCents: 90,
                currencySymbol: currencySymbol,
                displayString: salePriceDisplayString
            ),
            fulfillment: fulfillment,
            availability: availability
        )
    }
}
