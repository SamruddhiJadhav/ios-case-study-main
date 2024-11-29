//
//  DealDetailsRouterMock.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import XCTest
@testable import ProductViewer

final class DealDetailsRouterMock: DealDetailsRouterProtocol {
    var expectations = [XCTestExpectation]()

    func closeView() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
