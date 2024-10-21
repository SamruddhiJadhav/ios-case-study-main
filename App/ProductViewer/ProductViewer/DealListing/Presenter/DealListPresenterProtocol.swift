//
//  DealListPresenterProtocol.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 18/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol DealListPresenterProtocol {
    func onViewDidLoad()
    func onDidSelectDeal(_ viewModel: DealViewModel)
    func didTapOk()
}
