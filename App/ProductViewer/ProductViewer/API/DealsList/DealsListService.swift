//
//  DealsListService.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol DealsListServiceProtocol {
    typealias Result = Swift.Result<DealList, Error>
    
    func getDealsList(completion: @escaping (Result) -> Void)
}

final class DealsListService: DealsListServiceProtocol {
    private let url: URL?
    private let client: HTTPClient
    
    typealias Result = DealsListServiceProtocol.Result
    
    init(url: URL? = Environment.baseURL, client: HTTPClient = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))) {
        self.url = url
        self.client = client
    }
    
    func getDealsList(completion: @escaping (Result) -> Void) {
        guard let url = url else {
            completion(.failure(ServiceError.invalidURL))
            return
        }
        let dealsListEndpoint = DealsListEndpoint.get.url(baseURL: url)
        client.get(from: dealsListEndpoint) { result in
            switch result {
            case let .success((data, response)):
                if data.isEmpty {
                    completion(.failure(ServiceError.invalidData))
                }
                completion(DealsListService.map(data, from: response))
            case .failure:
                completion(.failure(ServiceError.connectivity))
            }
        }
    }
}

private extension DealsListService {
    static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try DealsListMapper.map(data, from: response)
            return .success(items)
        } catch {
            return .failure(ServiceError.invalidData)
        }
    }
}
