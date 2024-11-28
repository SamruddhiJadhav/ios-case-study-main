//
//  MainQueueDecorator+DealListViewProtocol.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 28/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

extension MainQueueDecorator: DealListViewProtocol where T: DealListViewProtocol {
    func updateDealsList(_ listViewModels: DealsListViewModel?) {
        DispatchQueue.main.async { [weak self] in
            self?.decoratee.updateDealsList(listViewModels)
        }
    }

    func showErrorMessage(_ message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.decoratee.showErrorMessage(message)
        }
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.decoratee.showLoadingIndicator()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.decoratee.hideLoadingIndicator()
        }
    }
}
