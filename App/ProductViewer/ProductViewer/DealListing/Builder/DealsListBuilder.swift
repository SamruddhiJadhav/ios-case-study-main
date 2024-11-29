//
//  DealsListBuilder.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

public final class DealsListBuilder {
    private init() {}

    static func build(selection: @escaping (DealDetailsPageModel) -> Void = { _ in }) -> UIViewController {
        let imageProvider = ImageProvider()
        let view = DealListViewController(imageProvider: imageProvider)
        let router = DealListRouter(selection: selection)
        let dealService = DealsListService()
        let dataSourceBuilder = DealsListDataSourceBuilder()
        let interactor = DealListInteractor(dealsListService: dealService)
        
        let mainQueueDecoratedView = MainQueueDecorator(decoratee: view)
        
        let presenter = DealListPresenter(
            view: mainQueueDecoratedView,
            router: router,
            interactor: interactor,
            dataSourceBuilder: dataSourceBuilder
        )
        
        view.presenter = presenter
        return view
    }
}

