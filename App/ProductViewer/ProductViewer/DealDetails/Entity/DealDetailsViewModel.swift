//
//  DealDetailsViewModel.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

struct DealDetailsViewModel {
    let dealDetails: NSAttributedString
    let fulfillmentType: String
    let productName: String
    let description: String
    let imageURL: String
    
    init(dealDetails: NSAttributedString, fulfillmentType: String, productName: String, description: String, imageURL: String) {
        self.dealDetails = dealDetails
        self.fulfillmentType = fulfillmentType
        self.productName = productName
        self.description = description
        self.imageURL = imageURL
    }
}
