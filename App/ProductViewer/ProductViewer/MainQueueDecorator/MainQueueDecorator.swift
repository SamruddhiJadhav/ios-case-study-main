//
//  MainQueueDecorator.swift
//  ProductViewer
//
//  Created by Samruddhi Jadhav on 28/11/24.
//  Copyright © 2024 Target. All rights reserved.
//

import Foundation

final class MainQueueDecorator<T: AnyObject> {
    weak var decoratee: T?
    
    init(decoratee: T?) {
        self.decoratee = decoratee
    }
}
