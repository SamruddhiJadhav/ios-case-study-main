//
//  DealsListMapperTests.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation
@testable import ProductViewer
import XCTest

class DealsListMapperTests: XCTestCase {
  func test_map_delivers_dealsOn200HTTPResponse() throws {
      let dealDetails = makeDeal(
        id: 1,
        title: "Product Title",
        aisle: "W2",
        description: "Product Description",
        imageURL: "Image url",
        regularPriceAmountInCents: 100,
        salePriceAmountInCents: 90,
        currencySymbol: "$",
        regularPriceDisplayString: "$100",
        salePriceDisplayString: "$90",
        availability: "In stock",
        fulfillment: "Online"
      )
      
      let json = makeItemsJSON(dealDetails.json)
      
      let result = try DealDetailsMapper.map(json, from: HTTPURLResponse(statusCode: 200))
      
      XCTAssertEqual(result, dealDetails.model)
      
      XCTAssertEqual(result.id, result.id)
      XCTAssertEqual(result.title, result.title)
      XCTAssertEqual(result.aisle, result.aisle)
      XCTAssertEqual(result.description, result.description)
      XCTAssertEqual(result.imageURL, result.imageURL)
      XCTAssertEqual(result.regularPrice, result.regularPrice)
      XCTAssertEqual(result.salePrice, result.salePrice)
      XCTAssertEqual(result.availability, result.availability)
      XCTAssertEqual(result.fulfillment, result.fulfillment)
  }
    
    
    func test_map_throwsErrorOnNon2xxHTTPResponse() throws {
        let emptyListJSON = makeItemsJSON([:])
        
        XCTAssertThrowsError(
            try DealDetailsMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: 300))
        )
    }

    func test_map_throwsErrorOn2xxHTTPResponseWithInvalidJSON() throws {
        let invalidJSON = Data("invalid json".utf8)
        
        XCTAssertThrowsError(
            try DealDetailsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: 200))
        )
    }

    // MARK: - Helpers
    
    private func makeDeal(
        id: Int,
        title: String,
        aisle: String,
        description: String,
        imageURL: String,
        regularPriceAmountInCents: Int,
        salePriceAmountInCents: Int,
        currencySymbol: String,
        regularPriceDisplayString: String,
        salePriceDisplayString: String,
        availability: String,
        fulfillment: String
    ) -> (model: DealDetails, json: [String: Any]) {
        let item = DealDetails.mock(
            id: id,
            title: title,
            aisle: aisle,
            description: description,
            imageURL: imageURL,
            regularPriceAmountInCents: regularPriceAmountInCents,
            salePriceAmountInCents: salePriceAmountInCents,
            currencySymbol: currencySymbol,
            regularPriceDisplayString: regularPriceDisplayString,
            salePriceDisplayString: salePriceDisplayString,
            availability: availability,
            fulfillment: fulfillment
        )
        
        let json: [String: Any] = [
            "id": id,
            "title": title,
            "aisle": aisle,
            "description": description,
            "image_url": imageURL,
            "regular_price": [
               "amount_in_cents":regularPriceAmountInCents,
               "currency_symbol": currencySymbol,
               "display_string":regularPriceDisplayString
            ],
            "sale_price": [
               "amount_in_cents": salePriceAmountInCents,
               "currency_symbol": currencySymbol,
               "display_string": salePriceDisplayString
            ],
            "fulfillment": fulfillment,
            "availability": availability
        ].compactMapValues { $0 }
        
        return (item, json)
    }
    
    func makeItemsJSON(_ items: [String: Any]) -> Data {
        return try! JSONSerialization.data(withJSONObject: items)
    }
}

