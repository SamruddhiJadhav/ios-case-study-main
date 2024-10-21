//
//  DealDetailsViewMock.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import XCTest
@testable import ProductViewer

final class DealDetailsViewMock: DealDetailsViewProtocol {
    var expectations = [XCTestExpectation]()

    func updateView(_ dealDetails: ProductViewer.DealDetailsViewModel) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func showErrorMessage(_ message: String) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func showLoadingIndicator() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func hideLoadingIndicator() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}

