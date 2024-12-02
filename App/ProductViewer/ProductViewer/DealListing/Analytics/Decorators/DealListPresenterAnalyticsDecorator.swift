//
//  DealListPresenterAnalyticsDecorator.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 2/12/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealListPresenterAnalyticsDecorator: DealListPresenterProtocol {
    private let analyticsManager: AnalyticsManager
    private let presenter: DealListPresenterProtocol
    
    init(_ manager: AnalyticsManager, _ presenter: DealListPresenterProtocol) {
        self.analyticsManager = manager
        self.presenter = presenter
    }

    func onViewDidLoad() {
        let event = DealListLoadedEvent(name: "onViewDidLoad", metadata: ["a": "a"])
        analyticsManager.trackEvent(event)
        
        presenter.onViewDidLoad()
    }
    
    func onDidSelectDeal(_ viewModel: DealViewModel) {
        let event = DealListLoadedEvent(name: "onDidSelectDeal", metadata: ["a": "a"])
        analyticsManager.trackEvent(event)
        
        presenter.onDidSelectDeal(viewModel)
    }
    
    func didTapOk() {
        let event = DealListLoadedEvent(name: "didTapOk", metadata: ["a": "a"])
        analyticsManager.trackEvent(event)
        
        presenter.didTapOk()
    }
}


final class DealListPresenterComposer: DealListPresenterProtocol {
    private let manager: [DealListPresenterProtocol]
    
    init(manager: [DealListPresenterProtocol]) {
        self.manager = manager
    }

    func onViewDidLoad() {
        manager.forEach {
            $0.onViewDidLoad()
        }
    }
    
    func onDidSelectDeal(_ viewModel: DealViewModel) {
        manager.forEach {
            $0.onDidSelectDeal(viewModel)
        }
    }
    
    func didTapOk() {
        manager.forEach {
            $0.didTapOk()
        }
    }
}

final class CrashlyticsLoginTracker: DealListPresenterProtocol {
    private let analyticsManager: AnalyticsManager
    
    init(analyticsManager: AnalyticsManager) {
        self.analyticsManager = analyticsManager
    }

    func onViewDidLoad() {
        let event = DealListLoadedEvent(name: "CrashlyticsLoginTracker", metadata: ["onViewDidLoad": "a"])
        analyticsManager.trackEvent(event)
    }

    func onDidSelectDeal(_ viewModel: DealViewModel) {
        let event = DealListLoadedEvent(name: "CrashlyticsLoginTracker", metadata: ["onDidSelectDeal": "a"])
        analyticsManager.trackEvent(event)
    }

    func didTapOk() {
        let event = DealListLoadedEvent(name: "CrashlyticsLoginTracker", metadata: ["didTapOk": "a"])
        analyticsManager.trackEvent(event)
    }
}

final class FirebaseLoginTracker: DealListPresenterProtocol {
    private let analyticsManager: AnalyticsManager
    
    init(analyticsManager: AnalyticsManager) {
        self.analyticsManager = analyticsManager
    }

    func onViewDidLoad() {
        let event = DealListLoadedEvent(name: "FirebaseLoginTracker", metadata: ["onViewDidLoad": "a"])
        analyticsManager.trackEvent(event)
    }

    func onDidSelectDeal(_ viewModel: DealViewModel) {
        let event = DealListLoadedEvent(name: "FirebaseLoginTracker", metadata: ["onDidSelectDeal": "a"])
        analyticsManager.trackEvent(event)
    }

    func didTapOk() {
        let event = DealListLoadedEvent(name: "FirebaseLoginTracker", metadata: ["didTapOk": "a"])
        analyticsManager.trackEvent(event)
    }
}
