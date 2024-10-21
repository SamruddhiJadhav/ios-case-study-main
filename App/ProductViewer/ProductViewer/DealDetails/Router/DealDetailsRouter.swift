//
//  DealDetailsRouter.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import UIKit

final class DealDetailsRouter: DealDetailsRouterProtocol {
    func closeView(_ view: DealDetailsViewProtocol?) {
        if let viewController = view as? UIViewController {
            viewController.navigationController?.popViewController(animated: true)
        }
    }
}
