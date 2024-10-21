//
//  DealViewModel.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 18/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

struct DealsListViewModel {
    let deals: [DealViewModel]
}

struct DealViewModel {
    let id: Int
    let dealDetails: NSAttributedString
    let fulfillmentType: String
    let productName: String
    let availabilityDetails: NSAttributedString
    let imageURL: String
    
    init(id: Int, dealDetails: NSAttributedString, fulfillmentType: String, productName: String, availabilityDetails: NSAttributedString, imageURL: String) {
        self.id = id
        self.dealDetails = dealDetails
        self.fulfillmentType = fulfillmentType
        self.productName = productName
        self.availabilityDetails = availabilityDetails
        self.imageURL = imageURL
    }
}
