//
//  DealDetailsInteractorMock.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

@testable import ProductViewer
import XCTest

final class DealDetailsInteractorMock: DealDetailsInteractorProtocol {
    var isConnectivityError = false
    
    func getDealDetails(for id: Int, completion: @escaping (ProductViewer.DealDetails) -> Void, onError: @escaping (any Error) -> Void) {
        if isConnectivityError {
            onError(ServiceError.connectivity)
        } else {
            completion(DealDetails.mock())
        }
    }
}
