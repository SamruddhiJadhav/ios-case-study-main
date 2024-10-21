//
//  ProductListingEndpoint.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

enum DealsListEndpoint {
    case get
    
    func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("deals")
        }
    }
}
