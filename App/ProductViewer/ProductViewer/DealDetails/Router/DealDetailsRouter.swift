//
//  DealDetailsRouter.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class DealDetailsRouter: DealDetailsRouterProtocol {
    private let view: DealDetailsViewController
    
    init(view: DealDetailsViewController) {
        self.view = view
    }
    
    func closeView() {
        view.navigationController?.popViewController(animated: true)
    }
}
