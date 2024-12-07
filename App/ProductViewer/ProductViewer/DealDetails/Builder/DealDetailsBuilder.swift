//
//  DealDetailsBuilder.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

protocol DealDetailsBuilding {
    func build(from model: DealDetailsPageModel) -> UIViewController
}

struct DealDetailsBuilder: DealDetailsBuilding {
    func build(from model: DealDetailsPageModel) -> UIViewController {
        let imageProvider = ImageProvider()
        let view = DealDetailsViewController(imageProvider: imageProvider)
        let router = DealDetailsRouter()
        let dealDetailsService = DealsService<DealDetails>()
        let interactor = DealDetailsInteractor(dealDetailsService: dealDetailsService)
        let dataSourceBuilder = DealDetailsDataSourceBuilder()

        let presenter = DealDetailsPresenter(
            view: view,
            router: router, 
            interactor: interactor,
            pageModel: model, 
            dataSourceBuilder: dataSourceBuilder
        )
        
        view.presenter = presenter
        return view
    }
}
