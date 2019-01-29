//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by Jerome Krakus on 21/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    func setUpCalcul(with op: String) {
        calculator.addNewNumber(9)
        
        switch op {
        case "+":
            calculator.plus()
        case "-":
            calculator.minus()
        default:
            break
        }
        
        calculator.addNewNumber(3)
    }
    
    func testGivenOperatorAlreadyAdded_WhenAddingAnotherOperator_ThenIsExpressionCorrectIsFalse() {
        calculator.addNewNumber(4)
        calculator.plus()
        
        calculator.minus()
        
        XCTAssert(calculator.isExpressionCorrect == false)
    }
    
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenIsExpressionCorrectIsTrue() {
        calculator.stringNumbers = [String()]
        
        calculator.addNewNumber(2)
        
        XCTAssert(calculator.isExpressionCorrect == true)
    }
    
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenCanAddOperatorIsTrue() {
        calculator.stringNumbers = [String()]
        
        calculator.addNewNumber(14)
        
        XCTAssert(calculator.canAddOperator == true)
    }
    
    func testGivenStringNumbersIsEmpty_WhenAddingOperator_ThenCanAddOperatorIsFalse() {
        calculator.stringNumbers = [String()]
        
        calculator.minus()
        
        XCTAssert(calculator.canAddOperator == false)
    }
    
    func testGivenStringNumersHasNineAndThree_WhenAdditioning_ThenResultIsTwelve() {
        setUpCalcul(with: "+")
        
        calculator.calculeTotal()
        
        XCTAssert(calculator.total == 12)
    }
    
    func testGivenStringNumersHasNineAndThree_WhenSubstract_ThenResultIsSix() {
        setUpCalcul(with: "-")

        calculator.calculeTotal()
        
        XCTAssert(calculator.total == 6)
    }
    
    func testGivenCalculeTotalIsDone_WhenUsingClear_ThenCalculatorIsReset() {
        setUpCalcul(with: "-")
        calculator.calculeTotal()
        
        calculator.clear()
        
        XCTAssert(calculator.stringNumbers == [String()])
        XCTAssert(calculator.operators == ["+"])
        XCTAssert(calculator.total == 0)
    }

}
