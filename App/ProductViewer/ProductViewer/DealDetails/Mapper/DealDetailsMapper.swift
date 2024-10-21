//
//  DealDetailsMapper.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealDetailsMapper {
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> DealDetails {
        let decoder = JSONDecoder()
        guard isOK(response), let model = try? decoder.decode(DealDetails.self, from: data) else {
            throw Error.invalidData
        }
        
        return model
    }
    
    private static func isOK(_ response: HTTPURLResponse) -> Bool {
        response.statusCode == 200
    }
}
