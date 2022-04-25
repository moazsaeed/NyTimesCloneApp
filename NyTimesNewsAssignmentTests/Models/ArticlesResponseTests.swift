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
        try! givenSUTFromJSON()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        systemUnderTest = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Type Tests
    
    func testConformsToDecodeable() {
        XCTAssert((systemUnderTest as Any) is Decodable)
    }
    
    func testConformsToEquatable() {
        XCTAssertEqual(systemUnderTest, systemUnderTest)
    }
        
    func testDecodableSetsArticles() {
        XCTAssertNotNil(systemUnderTest.articles)
        XCTAssertEqual(systemUnderTest.articles?.count ?? -1, 10)
    }

}
