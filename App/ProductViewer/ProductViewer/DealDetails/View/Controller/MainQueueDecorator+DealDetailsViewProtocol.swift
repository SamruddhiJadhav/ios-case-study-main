//
//  MainQueueDecorator+DealDetailsViewProtocol.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 29/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

extension MainQueueDecorator: DealDetailsViewProtocol where T: DealDetailsViewProtocol {
    func updateView(_ dealDetails: DealDetailsViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.decoratee?.updateView(dealDetails)
        }
    }
    
    func showErrorMessage(_ message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.decoratee?.showErrorMessage(message)
        }
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.decoratee?.showLoadingIndicator()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.decoratee?.hideLoadingIndicator()
        }
    }
}
