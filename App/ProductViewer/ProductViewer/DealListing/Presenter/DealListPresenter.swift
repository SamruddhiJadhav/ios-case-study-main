//
//  DealListPresenter.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealListPresenter: DealListPresenterProtocol {
    private var view: DealListViewProtocol?
    private let router: DealListRouterProtocol
    private let interactor: DealListInteractorProtocol
    private let dataSourceBuilder: DealsListDataSourceBuilderProtocol
    
    init(
        view: DealListViewProtocol?,
        router: DealListRouterProtocol,
        interactor: DealListInteractorProtocol,
        dataSourceBuilder: DealsListDataSourceBuilder
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.dataSourceBuilder = dataSourceBuilder
    }
    
    
    func onViewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getDealsList(completion: { [weak self] dealList in
            guard let self = self else {
                return
            }
            
            let listViewModels = self.dataSourceBuilder.dealsListViewModel(dealList)
            view?.updateDealsList(listViewModels)
            view?.hideLoadingIndicator()
        }, onError: { [weak self] error in
            self?.view?.showErrorMessage("Sorry we could not load the deal list")
            self?.view?.hideLoadingIndicator()
        })
    }
    
    func onDidSelectDeal(_ viewModel: DealViewModel) {
        let pageModel = DealDetailsPageModel(dealId: viewModel.id)
        router.onDidSelectDeal(model: pageModel)
    }
    
    func didTapOk() {}
}
