//
//  HTTPURLResponse+Extension.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(
            url: URL(string: "http://any-url.com")!,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
    }
}
