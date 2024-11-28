//
//  DealListRouter.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class DealListRouter: DealListRouterProtocol {
    private let dealDetailsbuilder: DealDetailsBuilding
    private let view: DealListViewProtocol
    
    init(dealDetailsBuilder: DealDetailsBuilding, view: DealListViewProtocol) {
        self.dealDetailsbuilder = dealDetailsBuilder
        self.view = view
    }

    func showDealDetails(model: DealDetailsPageModel) {
        let dealDetailsView = dealDetailsbuilder.build(from: model)
        if let sourceView = view as? UIViewController, let navigationController = sourceView.navigationController {
            navigationController.pushViewController(dealDetailsView, animated: true)
        }
    }
}
