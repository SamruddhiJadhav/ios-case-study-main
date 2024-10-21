//
//  DealsListMapper.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealsListMapper {
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> DealList {
        let decoder = JSONDecoder()
        
        guard isOK(response), let root = try? decoder.decode(DealList.self, from: data) else {
            throw Error.invalidData
        }
        
        return root
    }
    
    private static func isOK(_ response: HTTPURLResponse) -> Bool {
        response.statusCode == 200
    }
}
