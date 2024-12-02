//
//  DealListAnalyticsManager.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 29/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

struct AnalyticsManager {
    private let engine: AnalyticsEngine
    
    init(engine: AnalyticsEngine) {
        self.engine = engine
    }

    func trackEvent(_ event: any AnalyticsEvent) {
        engine.trackEvent(event)
    }
}
