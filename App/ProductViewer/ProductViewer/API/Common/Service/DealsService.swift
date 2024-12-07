//
//  DealsListService.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol DealsServiceProtocol {
    associatedtype Model: Decodable
    typealias Result = Swift.Result<Model, Error>
    
    func getDealsList(endpoint: APIEndpoint, completion: @escaping (Result) -> Void)
}

final class DealsService<T: Decodable>: DealsServiceProtocol {
    typealias Model = T
    
    private let client: HTTPClient
    
    typealias Result = Swift.Result<Model, Error>
    
    init(client: HTTPClient = URLSessionHTTPClient(session: URLSession(configuration: .default))) {
        self.client = client
    }
    
    func getDealsList(endpoint: APIEndpoint, completion: @escaping (Result) -> Void) {
        client.get(from: endpoint.urlRequest) { result in
            switch result {
            case let .success((data, response)):
                completion(DealsService.map(data, from: response))
            case .failure:
                completion(.failure(ServiceError.connectivity))
            }
        }
    }
}

private extension DealsService {
    static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try DealsDataMapper.map(data, from: response, asType: Model.self)
            return .success(items)
        } catch {
            return .failure(error)
        }
    }
}
