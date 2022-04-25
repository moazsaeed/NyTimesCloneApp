//
//  ArticleTests.swift
//  NyTimesNewsAssignmentTests
//
//  Created by Moaz Saeed (c) on 26/04/2022.
//

import XCTest
@testable import NyTimesNewsAssignment

class ArticleTests: XCTestCase {
    
    var systemUnderTest: Article!

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
        
    func testDecodableSetsTitle() {
        XCTAssertNotNil(systemUnderTest.title)
        XCTAssertEqual(systemUnderTest.title, "Sundays Off: U.A.E. Changes Its Weekend to Align With West" )
    }
    
    func testDecodableSetsSnippet() {
        XCTAssertNotNil(systemUnderTest.snippet)
        XCTAssertEqual(systemUnderTest.snippet, "The United Arab Emirates, in a nod to global markets, has changed its workweek, declaring that Sunday, a work day in much of the Arab world, is now part of the weekend. Fridays will be half days." )
    }
    
    func testDecodableSetsLeadParagraph() {
        XCTAssertNotNil(systemUnderTest.leadParagraph)
        XCTAssertEqual(systemUnderTest.leadParagraph, "CAIRO â€” The United Arab Emirates, a hub of international commerce, announced Tuesday that it would shift its weekends to bring them more in line with the Western calendar and global markets, once again showing its willingness to part ways with its Arab neighbors.")
    }
    
    func testDecodableSetsLeadDate() {
        XCTAssertNotNil(systemUnderTest.date)
        XCTAssertEqual(systemUnderTest.date?.ISO8601Format(), "2021-12-07T22:04:34Z")
    }
    
//    let title:String?
//    let snippet:String?
//    let leadParagraph:String?
//    let date:Date?
    
    private func givenSUTFromJSON(fileName: String = "\(ArticlesSearchResponse.self)") throws {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: fileName)
        let response = try decoder.decode(ArticlesSearchResponse.self, from: data)
        systemUnderTest = response.articles?.first
    }
    

}
