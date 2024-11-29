//
//  DealsListDataSourceBuilder.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 18/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

protocol DealsListDataSourceBuilderProtocol {
    func dealsListViewModel(_ dealsList: DealList) -> DealsListViewModel
}

final class DealsListDataSourceBuilder: DealsListDataSourceBuilderProtocol {
    func dealsListViewModel(_ dealsList: DealList) -> DealsListViewModel {
        let deals = dealsList.products.map { deal in
            dealViewModel(deal)
        }
        return DealsListViewModel(deals: deals)
    }
}

private extension DealsListDataSourceBuilder {
    func dealViewModel(_ deal: Deal) -> DealViewModel {
        return DealViewModel(
            id: deal.id,
            dealDetails: dealDetails(deal),
            fulfillmentType: deal.fulfillment.rawValue,
            productName: deal.title,
            availabilityDetails: availabilityDetails(deal),
            imageURL: deal.imageURL
        )
    }
    
    func dealDetails(_ deal: Deal) -> NSAttributedString {
        let regularPriceAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.small,
            .foregroundColor: UIColor.grayDarkest
        ]

        let attributedRegularPrice = NSAttributedString(
            string: deal.regularPrice.displayString,
            attributes: regularPriceAttributes
        )
        
        if let salePrice = deal.salePrice?.displayString {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.largeBold,
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
    
    func availabilityDetails(_ deal: Deal) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.targetTextGreen
        ]

        let availabilityString = NSMutableAttributedString(string: deal.availability.rawValue, attributes: attributes)
        
        let aisleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.grayDarkest
        ]
        let aisle = NSAttributedString(string: deal.aisle, attributes: aisleAttributes)
        let aisleString = NSAttributedString(string: " in aisle ")
        availabilityString.append(aisleString)
        availabilityString.append(aisle)

        return availabilityString
    }
}
