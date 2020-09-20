//
//  SafeSwiftTests.swift
//  SafeSwiftTests
//
//  Created by 李小争 on 2020/9/20.
//

import XCTest
@testable import SafeSwift

class SafeSwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    
    func testSubscript() {
        let str = "Hello world!"
        XCTAssertEqual(str[safe: 1], "e")
        XCTAssertNil(str[safe: 18])

        XCTAssertNil(str[safe: -5..<5])
        XCTAssertNil(str[safe: -5...5])

        XCTAssertEqual(str[safe: 0..<0], "")
        XCTAssertEqual(str[safe: 0..<4], "Hell")
        XCTAssertEqual(str[safe: 1..<5], "ello")
        XCTAssertEqual(str[safe: 7..<7], "")
        XCTAssertNil(str[safe: 10..<18])
        XCTAssertEqual(str[safe: 11..<12], "!")

        XCTAssertEqual(str[safe: 0...0], "H")
        XCTAssertEqual(str[safe: 0...4], "Hello")
        XCTAssertEqual(str[safe: 1...5], "ello ")
        XCTAssertEqual(str[safe: 7...7], "o")
        XCTAssertNil(str[safe: 10...18])
        XCTAssertEqual(str[safe: 11...11], "!")
        XCTAssertNil(str[safe: 11...12])

        let oneCharStr = "a"
        XCTAssertEqual(oneCharStr[safe: 0..<0], "")
        XCTAssertEqual(oneCharStr[safe: 0..<1], "a")
        XCTAssertNil(oneCharStr[safe: 0..<2])
        XCTAssertEqual(oneCharStr[safe: 1..<1], "")
        XCTAssertNil(oneCharStr[safe: 1..<2])

        XCTAssertEqual(oneCharStr[safe: 0...0], "a")
        XCTAssertNil(oneCharStr[safe: 0...1])
        XCTAssertNil(oneCharStr[safe: 0...2])
        XCTAssertNil(oneCharStr[safe: 1...1])
        XCTAssertNil(oneCharStr[safe: 1...2])

        // Empty string
        XCTAssertEqual(""[safe: 0..<0], "")
        XCTAssertNil(""[safe: 0..<1])
        XCTAssertNil(""[safe: 1..<1])
        XCTAssertNil(""[safe: 1..<2])
        XCTAssertNil(""[safe: 2..<3])

        XCTAssertNil(""[safe: 0...0])
        XCTAssertNil(""[safe: 0...1])
        XCTAssertNil(""[safe: 1..<1])
        XCTAssertNil(""[safe: 1...2])
        XCTAssertNil(""[safe: 2...3])
    }


}
