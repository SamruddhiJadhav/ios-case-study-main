//
//  DealListInteractorProtocol.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol DealListInteractorProtocol {
    func getDealsList(
        completion: @escaping (DealList) -> Void,
        onError: @escaping (_ errorMessage: Error) -> Void
    )
}
