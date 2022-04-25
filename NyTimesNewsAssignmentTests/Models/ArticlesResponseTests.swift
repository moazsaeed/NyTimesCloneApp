//
//  ArticlesResponseTests.swift
//  NyTimesNewsAssignmentTests
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import XCTest
@testable import NyTimesNewsAssignment

class ArticlesResponseTests: XCTestCase, DecodableTestCase {
    
    var systemUnderTest: ArticlesSearchResponse!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        try!
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
