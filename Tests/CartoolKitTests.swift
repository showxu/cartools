//
//  CartoolKitTests.swift
//  ProUITests
//
//  Created by show on 1/11/21.
//

import XCTest
import CoreUI
@testable import CartoolKit

class ProTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReader() throws {
        let candidateURL = URL(string: "file:///Applications/Safari.app/Contents/Resources/Assets.car")!
        Car.Reader<LazyRendition>(.init(uiCatalogName: "Assets", url: candidateURL)).read { result in
            
        }
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

