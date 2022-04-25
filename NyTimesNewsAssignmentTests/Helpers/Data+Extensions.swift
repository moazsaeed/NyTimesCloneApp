//
//  Data+Extensions.swift
//  NyTimesNewsAssignmentTests
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import Foundation
import XCTest

extension Data {
    public static func fromJSON(fileName: String) throws -> Data {
        let bundle = Bundle(for: TestBundleClass.self)
        let url = try XCTUnwrap(bundle.url(forResource: fileName, withExtension: "json"))
        return try Data(contentsOf: url)
    }
}

private class TestBundleClass { }
