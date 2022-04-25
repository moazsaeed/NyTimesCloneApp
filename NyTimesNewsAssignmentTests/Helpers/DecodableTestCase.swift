//
//  DecodableTestCase.swift
//  NyTimesNewsAssignmentTests
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import Foundation
import XCTest

protocol DecodableTestCase: class {
    associatedtype T: Decodable
    var systemUnderTest: T! { get set }
}
extension DecodableTestCase {
    func givenSUTFromJSON(fileName: String = "\(T.self)") throws {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: fileName)
        systemUnderTest = try decoder.decode(T.self, from: data)
    }
}
