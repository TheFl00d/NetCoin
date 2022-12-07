//
//  DoubleTest.swift
//  NetCoinTests
//
//  Created by Kwabena Ankamah on 06/12/2022.
//

import XCTest
@testable import NetCoin
final class DoubleTest: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testConvertDoubleToPercentage(){
        let num1 = -0.62
        var convertedNum1 = num1.toPercentString()
        print(convertedNum1)
        XCTAssertEqual(convertedNum1, "-0.62%")
    }
    
    func testPercentageRoundup(){
        let num2 = -0.626
        var convertedNum2 = num2.toPercentString()
        print(convertedNum2)
        XCTAssertEqual(convertedNum2, "-0.63%")
    }
    
    func testPercentageRoundDown(){
        let num3 = -0.621
        var convertedNum3 = num3.toPercentString()
        print(convertedNum3)
        XCTAssertEqual(convertedNum3, "-0.62%")
    }
    func testConvertDoubleToString(){
        let num4 = 29.39
        var convertedNum4 = num4.toCurrency()
        XCTAssertEqual(convertedNum4, "$29.39")
    }
    
    func testRoundUpDoubleToString(){
        let num5 = 29.39789
        var convertedNum5 = num5.toCurrency()
        XCTAssertEqual(convertedNum5, "$29.40")
    }
    func testRoundDownDoubleToString(){
        let num6 = 29.332
        var convertedNum6 = num6.toCurrency()
        XCTAssertEqual(convertedNum6, "$29.33")
    }

   
}
