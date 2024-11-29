//
//  DealDetailsBuilder.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class DealDetailsBuilder {
    private init() {}

    static func build(from model: DealDetailsPageModel) -> UIViewController {
        let view = DealDetailsViewController()
        let router = DealDetailsRouter(view: view)
        let dealDetailsService = DealDetailsService()
        let interactor = DealDetailsInteractor(dealDetailsService: dealDetailsService)
        let dataSourceBuilder = DealDetailsDataSourceBuilder()

        let mainQueueDecoratedView = MainQueueDecorator(decoratee: view)

        let presenter = DealDetailsPresenter(
            view: mainQueueDecoratedView,
            router: router,
            interactor: interactor,
            pageModel: model, 
            dataSourceBuilder: dataSourceBuilder
        )
        
        view.presenter = presenter
        return view
    }
}
