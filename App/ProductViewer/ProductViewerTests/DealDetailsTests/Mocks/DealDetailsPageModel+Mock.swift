//
//  DealDetailsPageModelMock.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

@testable import ProductViewer

extension DealDetailsPageModel {
    static func mock(dealId: Int = 1) -> DealDetailsPageModel {
        return DealDetailsPageModel(dealId: dealId)
    }
}
