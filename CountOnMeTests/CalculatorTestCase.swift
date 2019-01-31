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
    // Declaration of calculator
    var calculator: Calculator!
    
    /// Reset state before each test method in a test case is called
    override func setUp() {
        super.setUp()
        // Init of calculator
        calculator = Calculator()
    }
    
    /// Set up a calculation based on the parameter
    ///
    /// - parameter op: Can be "+" or "-"
    func setUpCalculation(with op: String) {
        // Adding number 9
        calculator.addNewNumber(9)
        
        // Add operator for the calculation
        switch op {
        case "+":
            calculator.plus()
        case "-":
            calculator.minus()
        default:
            break
        }
        
        // Adding number 3
        calculator.addNewNumber(3)
    }
    
    /// Testing the computed property IsExpressionCorrect
    func testGivenOperatorAlreadyAdded_WhenAddingAnotherOperator_ThenIsExpressionCorrectIsFalse() {
        // Given
        calculator.addNewNumber(4)
        calculator.plus()
        
        // When
        calculator.minus()
        
        // Then
        XCTAssert(calculator.isExpressionCorrect == false)
    }
    
    /// Testing the computed property IsExpressionCorrect
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenIsExpressionCorrectIsTrue() {
        // Given
        calculator.stringNumbers = [String()]
        
        // When
        calculator.addNewNumber(2)
        
        // Then
        XCTAssert(calculator.isExpressionCorrect == true)
    }
    
    /// Testing the computed property CanAddOperator
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenCanAddOperatorIsTrue() {
        // Given
        calculator.stringNumbers = [String()]
        
        // When
        calculator.addNewNumber(14)
        
        // Then
        XCTAssert(calculator.canAddOperator == true)
    }
    
    /// Testing the computed property CanAddOperator
    func testGivenStringNumbersIsEmpty_WhenAddingOperator_ThenCanAddOperatorIsFalse() {
        // Given
        calculator.stringNumbers = [String()]
        
        // When
        calculator.minus()
        
        // Then
        XCTAssert(calculator.canAddOperator == false)
    }
    
    /// Testing calculeTotal func with an addition
    func testGivenStringNumersHasNineAndThree_WhenAdditioning_ThenResultIsTwelve() {
        // Given
        setUpCalculation(with: "+")
        
        // When
        calculator.calculeTotal()
        
        // Then
        XCTAssert(calculator.total == 12)
    }
    
    /// Testing calculeTotal func with a substraction
    func testGivenStringNumersHasNineAndThree_WhenSubstract_ThenResultIsSix() {
        // Given
        setUpCalculation(with: "-")
        
        // When
        calculator.calculeTotal()
        
        // Then
        XCTAssert(calculator.total == 6)
    }
    
    /// Testing clear func
    func testGivenCalculeTotalIsDone_WhenUsingClear_ThenCalculatorIsReset() {
        // Given
        setUpCalculation(with: "-")
        calculator.calculeTotal()
        
        // When
        calculator.clear()
        
        // Then
        XCTAssert(calculator.stringNumbers == [String()])
        XCTAssert(calculator.operators == ["+"])
        XCTAssert(calculator.total == 0)
    }

}
