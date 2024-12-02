//
//  DealListPresenterAnalyticsDecorator.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 2/12/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealListPresenterAnalyticsDecorator: DealListPresenterProtocol {
    private let manager: AnalyticsManager
    private let presenter: DealListPresenterProtocol
    
    init(_ manager: AnalyticsManager, _ presenter: DealListPresenterProtocol) {
        self.manager = manager
        self.presenter = presenter
    }

    func onViewDidLoad() {
        let event = DealListLoadedEvent(name: "name", metadata: ["a": "a"])
        presenter.onViewDidLoad()
        manager.trackEvent(event)
    }
    
    func onDidSelectDeal(_ viewModel: DealViewModel) {
        presenter.onDidSelectDeal(viewModel)
    }
    
    func didTapOk() {
        presenter.didTapOk()
    }
}
