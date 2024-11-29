//
//  DealDetailsEndPoint.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

enum DealDetailsEndPoint {
    case get(dealID: Int)
    
    func url(baseURL: URL) -> URL {
        switch self {
        case let .get(dealId):
            return baseURL.appendingPathComponent("deals/\(dealId)")
        }
    }
}
