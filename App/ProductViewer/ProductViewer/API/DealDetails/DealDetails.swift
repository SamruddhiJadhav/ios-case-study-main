//
//  DealDetails.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

struct DealDetails: Codable, Equatable {
    let id: Int
    let title, aisle, description: String
    let imageURL: String
    let regularPrice: DealDetailsPrice
    let salePrice: DealDetailsPrice?
    let fulfillment, availability: String

    enum CodingKeys: String, CodingKey {
        case id, title, aisle, description
        case imageURL = "image_url"
        case regularPrice = "regular_price"
        case salePrice = "sale_price"
        case fulfillment, availability
    }
}

struct DealDetailsPrice: Codable, Equatable {
    let amountInCents: Int
    let currencySymbol, displayString: String

    enum CodingKeys: String, CodingKey {
        case amountInCents = "amount_in_cents"
        case currencySymbol = "currency_symbol"
        case displayString = "display_string"
    }
}
