//
//  DealList.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

struct DealList: Codable {
    let products: [Deal]
}

struct Deal: Codable {
    let id: Int
    let title, aisle, description: String
    let imageURL: String
    let regularPrice: DealListPrice
    let fulfillment: Fulfillment
    let availability: Availability
    let salePrice: DealListPrice?

    enum CodingKeys: String, CodingKey {
        case id, title, aisle, description
        case imageURL = "image_url"
        case regularPrice = "regular_price"
        case fulfillment, availability
        case salePrice = "sale_price"
    }
}

enum Availability: String, Codable {
    case inStock = "In stock"
}

enum Fulfillment: String, Codable {
    case online = "Online"
}

struct DealListPrice: Codable {
    let amountInCents: Int
    let currencySymbol: CurrencySymbol
    let displayString: String

    enum CodingKeys: String, CodingKey {
        case amountInCents = "amount_in_cents"
        case currencySymbol = "currency_symbol"
        case displayString = "display_string"
    }
}

enum CurrencySymbol: String, Codable {
    case empty = "$"
}
