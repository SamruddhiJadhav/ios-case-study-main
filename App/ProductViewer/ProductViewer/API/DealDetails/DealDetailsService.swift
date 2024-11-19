//
//  DealDetailsService.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 17/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol DealDetailsServiceProtocol {
    typealias Result = Swift.Result<DealDetails, Error>
    
    func getDealDetails(for id: Int, completion: @escaping (Result) -> Void)
}

final class DealDetailsService: DealDetailsServiceProtocol {
    private let url: URL?
    private let client: HTTPClient
    
    typealias Result = DealDetailsServiceProtocol.Result
    
    init(
        url: URL? = Environment.baseURL,
        client: HTTPClient = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    ) {
        self.url = url
        self.client = client
    }
    
    func getDealDetails(for id: Int, completion: @escaping (Result) -> Void) {
        guard let url = url else {
            completion(.failure(ServiceError.invalidURL))
            return
        }
        let dealDetailsEndPoint = DealDetailsEndPoint.get(id).url(baseURL: url)
        client.get(from: dealDetailsEndPoint) { result in
            switch result {
            case let .success((data, response)):
                completion(DealDetailsService.map(data, from: response))
            case .failure:
                completion(.failure(ServiceError.connectivity))
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try DealDetailsMapper.map(data, from: response)
            return .success(items)
        } catch {
            return .failure(ServiceError.invalidData)
        }
    }
}
