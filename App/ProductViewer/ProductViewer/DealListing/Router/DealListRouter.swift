//
//  DealListRouter.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class DealListRouter: DealListRouterProtocol {
    private let selection: (DealDetailsPageModel) -> Void
    
    init(selection: @escaping (DealDetailsPageModel) -> Void) {
        self.selection = selection
    }

    func onDidSelectDeal(model: DealDetailsPageModel) {
        selection(model)
    }
}
