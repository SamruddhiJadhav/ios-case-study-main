//
//  DealDetailsViewProtocol.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol DealDetailsViewProtocol: AnyObject {
    func updateView(_ dealDetails: DealDetailsViewModel)
    func showErrorMessage(_ message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
