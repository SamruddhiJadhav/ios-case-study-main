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
    
    init(dealDetailsBuilder: DealDetailsBuilding) {
        self.dealDetailsbuilder = dealDetailsBuilder
    }

    func showDealDetails(from view: DealListViewProtocol?, model: DealDetailsPageModel) {
        let dealDetailsView = dealDetailsbuilder.build(from: model)
        if let sourceView = view as? UIViewController, let navigationController = sourceView.navigationController {
            navigationController.pushViewController(dealDetailsView, animated: true)
        }
    }
}
