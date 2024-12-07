//
//  DealsDataMapper.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealsDataMapper {
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map<T: Decodable>(_ data: Data, from response: HTTPURLResponse, asType: T.Type) throws -> T {
        let decoder = JSONDecoder()
        
        guard isOK(response), let root = try? decoder.decode(asType, from: data) else {
            throw Error.invalidData
        }
        
        return root
    }
    
    private static func isOK(_ response: HTTPURLResponse) -> Bool {
        response.statusCode == 200
    }
}
