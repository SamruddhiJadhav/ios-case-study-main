//
//  DealDetailsEndPoint.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

enum DealDetailsEndPoint: APIEndpoint {
    case get(Int)
    
    var urlRequest: URLRequest {
        switch self {
        case let .get(dealId):
            return URLRequest(url: Environment.baseURL.appendingPathComponent("deals/\(dealId)"))
        }
    }
}
