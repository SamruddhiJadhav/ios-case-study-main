//
//  DealListFetchedEvent.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 2/12/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

struct DealListFetchedEvent: AnalyticsEvent {
    var name: String
    var metadata: [String : Any]
}
