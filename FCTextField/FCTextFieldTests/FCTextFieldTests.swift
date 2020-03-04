//
//  FCTextFieldTests.swift
//  FCTextFieldTests
//
//  Created by Fernanda Carvalho on 12/02/20.
//  Copyright © 2020 FernandaCarvalho. All rights reserved.
//

import XCTest
@testable import FCTextField

class FCTextFieldTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        func testFCTextField() {
            let fcTxt = FCTextField()
            XCTAssertEqual(fcTxt.bottomActiveColor, UIColor.blue)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
