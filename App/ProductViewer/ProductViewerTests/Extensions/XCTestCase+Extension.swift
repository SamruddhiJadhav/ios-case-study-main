//
//  XCTestCase+Extension.swift
//  ProductViewerTests
//
//  Created by Samruddhi Jadhav on 21/10/24.
//  Copyright © 2024 Target. All rights reserved.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
