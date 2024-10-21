//
//  HTTPClient.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    func get(from url: URL, completion: @escaping(Result) -> Void)
}
