//
//  ProductListingEndpoint.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

enum DealsListEndpoint: APIEndpoint {
    case get
    
    var urlRequest: URLRequest {
        switch self {
        case .get:
            return URLRequest(url: Environment.baseURL.appendingPathComponent("deals"))
        }
    }
}
