//
//  XCTestExpectation+Extension.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import XCTest

extension XCTestExpectation {
    static let expectationTimeout = 0.3
        
    static func fulfill(with fulfilledDescription: String, from expectations: [XCTestExpectation]) {
        for testExpectation in expectations {
            if testExpectation.expectationDescription == fulfilledDescription {
                testExpectation.fulfill()
            }
        }
    }
}
