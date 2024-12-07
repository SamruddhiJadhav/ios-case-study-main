//
//  DealDetailsInteractor.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 19/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealDetailsInteractor: DealDetailsInteractorProtocol {
    private let dealDetailsService: DealsService<DealDetails>
    
    init(dealDetailsService: DealsService<DealDetails>) {
        self.dealDetailsService = dealDetailsService
    }

    func getDealDetails(
        for id: Int,
        completion: @escaping (DealDetails) -> Void,
        onError: @escaping (_ errorMessage: Error) -> Void
    ) {
        dealDetailsService.getDealsList(endpoint: DealDetailsEndPoint.get(id)) { result in
            switch result {
            case let .success(list):
                completion(list)
            case let .failure(error):
                onError(error)
            }
        }
    }
}
