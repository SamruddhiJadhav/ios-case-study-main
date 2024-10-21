//
//  DealDetailsPresenter.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealDetailsPresenter: DealDetailsPresenterProtocol {
    private weak var view: DealDetailsViewProtocol?
    private let pageModel: DealDetailsPageModel
    private let router: DealDetailsRouterProtocol
    private let interactor: DealDetailsInteractorProtocol
    private let dataSourceBuilder: DealDetailsDataSourceBuilderProtocol
    
    init(
        view: DealDetailsViewProtocol,
        router: DealDetailsRouterProtocol,
        interactor: DealDetailsInteractorProtocol,
        pageModel: DealDetailsPageModel,
        dataSourceBuilder: DealDetailsDataSourceBuilderProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.pageModel = pageModel
        self.dataSourceBuilder = dataSourceBuilder
    }

    func didTapBack() {
        router.closeView(view)
    }
    
    func onViewDidLoad() {
        view?.showLoadingIndicator()
        fetchDealDetails()
    }
    
    func didTapOk() {
        router.closeView(view)
    }
    
    func fetchDealDetails() {
        interactor.getDealDetails(for: pageModel.dealId) { [weak self] deal in
            guard let self = self else {
                return
            }
            let viewModel = self.dataSourceBuilder.dealDetailsViewModel(deal)
            DispatchQueue.main.async {
                self.view?.updateView(viewModel)
                self.view?.hideLoadingIndicator()
            }
            
        } onError: { [weak self] error in
            DispatchQueue.main.async {
                self?.view?.hideLoadingIndicator()
                self?.view?.showErrorMessage("Sorry, we could not load the deal details.")
            }
        }
    }
}
