//
//  DealDetailsPresenterTests.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

@testable import ProductViewer
import XCTest

class DealDetailsPresenterTests: XCTestCase {
    let routerMock = DealDetailsRouterMock()
    let viewMock = DealDetailsViewMock()
    let interactorMock = DealDetailsInteractorMock()
    let dataSourceBuilderMock = DealDetailsDataSourceBuilderMock()
    
    func test_didTapBack_closesView() {
        routerMock.expectations.append(expectation(description: "closeView()"))
        let presenter = makeSUT()
        presenter.didTapBack()
        wait(for: routerMock.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func test_didTapOk_closesView() {
        routerMock.expectations.append(expectation(description: "closeView()"))
        let presenter = makeSUT()
        presenter.didTapBack()
        wait(for: routerMock.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func test_fetchDealsList_returnsViewModel() {
        viewMock.expectations.append(expectation(description: "updateView(_:)"))
        viewMock.expectations.append(expectation(description: "hideLoadingIndicator()"))
        interactorMock.isConnectivityError = false
        let presenter = makeSUT()
        presenter.fetchDealDetails()
        wait(for: viewMock.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func test_fetchDealsList_returnsError() {
        viewMock.expectations.append(expectation(description: "showErrorMessage(_:)"))
        viewMock.expectations.append(expectation(description: "hideLoadingIndicator()"))
        interactorMock.isConnectivityError = true
        let presenter = makeSUT()
        presenter.fetchDealDetails()
        wait(for: viewMock.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    // MARK: - Helpers

    func makeSUT(
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> DealDetailsPresenter {
        let presenter = DealDetailsPresenter(
            view: viewMock,
            router: routerMock,
            interactor: interactorMock,
            pageModel: DealDetailsPageModel.mock(),
            dataSourceBuilder: dataSourceBuilderMock
        )
        trackForMemoryLeaks(presenter, file: file, line: line)
        return presenter
    }
}
