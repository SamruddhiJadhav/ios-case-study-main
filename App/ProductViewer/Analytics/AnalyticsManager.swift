//
//  DealListAnalyticsManager.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 29/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

//https://www.youtube.com/watch?v=GzFD7R_CI04&list=PLyjgjmI1UzlSWtjAMPOt03L7InkCRlGzb&index=3

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
