//
//  APIEndpoint.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 7/12/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol APIEndpoint {
    var urlRequest: URLRequest { get }
}
