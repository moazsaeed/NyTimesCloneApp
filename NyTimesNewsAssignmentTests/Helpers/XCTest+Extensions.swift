//
//  XCTest+Extensions.swift
//  NyTimesNewsAssignmentTests
//
//  Created by Moaz Saeed (c) on 25/04/2022.
//

import Foundation
@testable import NyTimesNewsAssignment
import XCTest

extension XCTest {
    func givenLaunches(count: Int) -> [Launch] {
        return (1 ... count).map { i in
            return Launch(id: "id_\(i)", name: "name_\(i)", details: "details_\(i)", date_utc: Date(), upcoming: true, success: true, rocket: "rocket_\(i)")
        }
    }
    
    func givenURLs(count: Int) -> [URL] {
        return (1 ... count).map { _ in
            return URL(string: "https://farm5.staticflickr.com/4711/40126461411_aabc643fd8_b.jpg")!
        }
    }
}
