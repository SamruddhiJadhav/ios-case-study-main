//
//  AnalyticsEngine.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 29/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol AnalyticsEngine {
    func trackEvent(_ event: AnalyticsEvent)
}

struct FireBaseSDK: AnalyticsEngine {
    func trackEvent(_ event: AnalyticsEvent) {
        print("Name: \(event.name), metadata: \(event.metadata)")
    }
}
