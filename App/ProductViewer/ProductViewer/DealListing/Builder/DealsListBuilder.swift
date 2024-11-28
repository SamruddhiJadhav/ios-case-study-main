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
        let wireframe = DealListRouter(dealDetailsBuilder: DealDetailsBuilder(), view: view)
        let dealService = DealsListService()
        let dataSourceBuilder = DealsListDataSourceBuilder()
        let interactor = DealListInteractor(dealsListService: dealService)
        
        let mainQueueDecoratedView = MainQueueDecorator(decoratee: view)
        
        let presenter = DealListPresenter(
            view: mainQueueDecoratedView,
            wireframe: wireframe,
            interactor: interactor,
            dataSourceBuilder: dataSourceBuilder
        )
        
        view.presenter = presenter
        return view
    }
}

