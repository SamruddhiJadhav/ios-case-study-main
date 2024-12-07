//
//  DealsListBuilder.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

protocol DealsListBuilding {
    func build() -> UIViewController
}

struct DealsListBuilder: DealsListBuilding {
    func build() -> UIViewController {
        let imageProvider = ImageProvider()
        let view = DealListViewController(imageProvider: imageProvider)
        let wireframe = DealListRouter(dealDetailsBuilder: DealDetailsBuilder())
        let dealService = DealsService<DealList>()
        let dataSourceBuilder = DealsListDataSourceBuilder()
        let interactor = DealListInteractor(dealsListService: dealService)
        let presenter = DealListPresenter(
            view: view,
            wireframe: wireframe,
            interactor: interactor,
            dataSourceBuilder: dataSourceBuilder
        )
        
        view.presenter = presenter
        return view
    }
}

