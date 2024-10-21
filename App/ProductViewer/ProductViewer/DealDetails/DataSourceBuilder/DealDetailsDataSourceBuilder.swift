//
//  DealDetailsDataSourceBuilder.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

protocol DealDetailsDataSourceBuilderProtocol {
    func dealDetailsViewModel(_ dealDetails: DealDetails) -> DealDetailsViewModel
}

final class DealDetailsDataSourceBuilder: DealDetailsDataSourceBuilderProtocol {
    func dealDetailsViewModel(_ dealDetails: DealDetails) -> DealDetailsViewModel {
        return DealDetailsViewModel(
            dealDetails: dealPriceDetails(dealDetails),
            fulfillmentType: dealDetails.fulfillment,
            productName: dealDetails.title,
            description: dealDetails.description,
            imageURL: dealDetails.imageURL
        )
    }
}

private extension DealDetailsDataSourceBuilder {
    func dealPriceDetails(_ deal: DealDetails) -> NSAttributedString {
        let regularPriceAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.small,
            .foregroundColor: UIColor.grayDarkest
        ]

        let attributedRegularPrice = NSAttributedString(string: deal.regularPrice.displayString, attributes: regularPriceAttributes)
        
        if let salePrice = deal.salePrice?.displayString {
            let attributes: [NSAttributedString.Key: Any] = [
                .font:  UIFont.largeBold,
                .foregroundColor: UIColor.redDarkest
            ]

            let attributedSalePrice = NSMutableAttributedString(string: salePrice, attributes: attributes)
            let regString = NSAttributedString(string: " reg. ", attributes: regularPriceAttributes)
            attributedSalePrice.append(regString)
            attributedSalePrice.append(attributedRegularPrice)
            return attributedSalePrice
        }
        return attributedRegularPrice
    }
}
