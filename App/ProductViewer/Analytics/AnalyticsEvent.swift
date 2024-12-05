//
//  AnalyticsEvent.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 29/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol AnalyticsEvent {
    var name: String { get }
    var metadata: [String: Any] { get }
}
