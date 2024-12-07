//
//  DealListInteractor.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class DealListInteractor: DealListInteractorProtocol {
    private let dealsListService: DealsService<DealList>
    
    init(dealsListService: DealsService<DealList>) {
        self.dealsListService = dealsListService
    }

    func getDealsList(
        completion: @escaping (DealList) -> Void,
        onError: @escaping (_ errorMessage: Error) -> Void
    ) {
        dealsListService.getDealsList(endpoint: DealsListEndpoint.get) { result in
            switch result {
            case let .success(list):
                completion(list)
            case let .failure(error):
                onError(error)
            }
        }
    }
}
