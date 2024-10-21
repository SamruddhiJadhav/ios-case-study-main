//
//  DealsListDataSourceBuilderMock.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import XCTest
@testable import ProductViewer

final class DealDetailsDataSourceBuilderMock: DealDetailsDataSourceBuilderProtocol {
    func dealDetailsViewModel(_ dealDetails: ProductViewer.DealDetails) -> ProductViewer.DealDetailsViewModel {
        DealDetailsViewModel.mock()
    }
}
