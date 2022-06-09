//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by MacMini01 on 08/06/2022.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    func testSpecialCharacter() throws {
        XCTAssertEqual(true, Char.specialCharacter(char: "+"))
        XCTAssertEqual(true, Char.specialCharacter(char: "-"))
        XCTAssertEqual(true, Char.specialCharacter(char: "*"))
        XCTAssertEqual(true, Char.specialCharacter(char: "/"))
        XCTAssertEqual(false, Char.specialCharacter(char: "%"))
    }

    func testIsANumber() throws {
        XCTAssertEqual(false, Char.isANumber(char: "n"))
        XCTAssertEqual(true, Char.isANumber(char: "1"))
        XCTAssertEqual(false, Char.isANumber(char: "h"))
        XCTAssertEqual(true, Char.isANumber(char: "9"))
    }
    
    func testValidExpression() {
        XCTAssertEqual(true, Expression.validExpression(expression: "9+3/2*4+7"))
        XCTAssertEqual(false, Expression.validExpression(expression: "-3"))
        XCTAssertEqual(true, Expression.validExpression(expression: "3+8%"))
        XCTAssertEqual(false, Expression.validExpression(expression: "432*453+++332"))
    }
    
    func testReWriteExpression() {
        XCTAssertEqual("1.0*(9/(90*0.01)+5/(50*0.01))", Expression.reWriteExpression(expression: "9/90%+5/50%"))
    }
    
    func testExpressionValue() {
        let (check1, value1) = Expression.getExpressionValue(expression: "9/90%+5/50%")
        XCTAssertTrue(check1)
        XCTAssertEqual(value1, 20.0)
        
        let (check2, value2) = Expression.getExpressionValue(expression: "-9+++3")
        XCTAssertFalse(check2)
        XCTAssertEqual(value2, 0.0)
    }

}
