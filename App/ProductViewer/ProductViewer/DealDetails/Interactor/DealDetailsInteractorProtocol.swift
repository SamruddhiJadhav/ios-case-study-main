//
//  File.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

protocol DealDetailsInteractorProtocol {
    func getDealDetails(
        for id: Int,
        completion: @escaping (DealDetails) -> Void,
        onError: @escaping (_ errorMessage: Error) -> Void
    )
}
