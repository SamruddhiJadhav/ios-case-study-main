//
//  DealListAnalyticsInteractorDecorator.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 2/12/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealListAnalyticsInteractorDecorator: DealListInteractorProtocol {
    private let interactor: DealListInteractorProtocol
    private let analyticsManager: AnalyticsManager
    
    init(interactor: DealListInteractorProtocol, analytics: AnalyticsManager) {
        self.interactor = interactor
        self.analyticsManager = analytics
    }

    func getDealsList(completion: @escaping (DealList) -> Void, onError: @escaping (any Error) -> Void) {
        interactor.getDealsList { [weak self] dealList in
            self?.analyticsManager.trackEvent(DealListFetchedEvent(name: "DealListFetchedEvent", metadata: ["1": "2"]))
            completion(dealList)
        } onError: { [weak self] errorMessage in
            self?.analyticsManager.trackEvent(DealListFetchErrorEvent(name: "DealListFetchErrorEvent", metadata: ["3": "4"]))
            onError(errorMessage)
        }
    }
}
