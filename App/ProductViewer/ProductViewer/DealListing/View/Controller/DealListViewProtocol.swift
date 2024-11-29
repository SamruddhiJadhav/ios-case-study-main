//
//  DealListViewProtocol.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 18/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol DealListViewProtocol: AnyObject {
    func updateDealsList(_ listViewModels: DealsListViewModel?)
    func showErrorMessage(_ message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
