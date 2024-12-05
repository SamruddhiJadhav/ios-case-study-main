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

    static func build(selection: @escaping (DealDetailsPageModel) -> Void = { _ in }, analyticsEngine: AnalyticsEngine) -> UIViewController {

        let manager = AnalyticsManager(engine: analyticsEngine)
        
        let imageProvider = ImageProvider()
        let view = DealListViewController(imageProvider: imageProvider)
        let router = DealListRouter(selection: selection)
        let dealService = DealsListService()
        let dataSourceBuilder = DealsListDataSourceBuilder()
        let interactor = DealListInteractor(dealsListService: dealService)
        
        let mainQueueDecoratedView = MainQueueDecorator(decoratee: view)
        let analyticsInteractorDecorator = DealListAnalyticsInteractorDecorator(interactor: interactor, analytics: manager)

        let presenter = DealListPresenter(
            view: mainQueueDecoratedView,
            router: router,
            interactor: analyticsInteractorDecorator,
            dataSourceBuilder: dataSourceBuilder
        )
//        let crash = CrashlyticsLoginTracker(analyticsManager: manager)
//        let fire = FirebaseLoginTracker(analyticsManager: manager)
//        let composer = DealListPresenterComposer(manager: [presenter, crash, fire])
//        
//        view.presenter = composer
        
        let decoratedPresenter = DealListPresenterAnalyticsDecorator(manager, presenter)
        view.presenter = decoratedPresenter
        return view
    }
}


