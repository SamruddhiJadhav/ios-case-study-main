//
//  ServiceError.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 20/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

enum ServiceError: Swift.Error {
    case connectivity
    case invalidData
    case invalidURL
}
