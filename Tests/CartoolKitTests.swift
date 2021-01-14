//
//  CartoolTests.swift
//  ProUITests
//
//  Created by Xudong Xu on 1/11/21.
//

import XCTest
@testable import CartoolKit

class CartoolTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCarFileSynchronizedReading() throws {
        let providedURL = URL(string: "file:///Applications/Xcode.app/Contents/Resources/Assets.car")!
        let renditions = try Car.Reader<LazyRendition>(.init(uiCatalogName: "Assets", url: providedURL)).read()
        XCTAssert(renditions.count > 0)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testCarFileSynchronizedReadingPerformance() throws {
        // This is a performance test case of CarFileSynchronizedReading.
        measure {
            // Put the code you want to measure the time of here.
            let providedURL = URL(string: "file:///Applications/Xcode.app/Contents/Resources/Assets.car")!
            let _ = try! Car.Reader<LazyRendition>(.init(uiCatalogName: "Assets", url: providedURL)).read()
        }
    }
    
    func testUnsafeUnslicedImagePerformance() throws {
        // This is a performance test case of UnsafeUnslicedImage.
        let providedURL = URL(string: "file:///Applications/Xcode.app/Contents/Resources/Assets.car")!
        let renditions = try! Car.Reader<LazyRendition>(.init(uiCatalogName: "Assets", url: providedURL)).read()
        measure {
            // Put the code you want to measure the time of here.
            _ = renditions.map { $0.unsafeUnslicedImage() }
        }
    }
    
    func testUnsafeUnslicedImageRepPerformance() throws {
        // This is a performance test case of UnsafeUnslicedImageRep.
        let providedURL = URL(string: "file:///Applications/Xcode.app/Contents/Resources/Assets.car")!
        let renditions = try! Car.Reader<LazyRendition>(.init(uiCatalogName: "Assets", url: providedURL)).read()
        measure {
            // Put the code you want to measure the time of here.
            _ = renditions.map { $0.unsafeUnslicedImageRep() }
        }
    }
    
    func testUnsafeUnslicedNSImagePerformance() throws {
        // This is a performance test case of UnsafeUnslicedNSImage.
        let providedURL = URL(string: "file:///Applications/Xcode.app/Contents/Resources/Assets.car")!
        let renditions = try! Car.Reader<LazyRendition>(.init(uiCatalogName: "Assets", url: providedURL)).read()
        measure {
            // Put the code you want to measure the time of here.
            _ = renditions.map { $0.unsafeUnslicedNSImage }
        }
    }
}
