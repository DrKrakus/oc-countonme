//
//  CountOnMeUITests.swift
//  CountOnMeUITests
//
//  Created by Jerome Krakus on 21/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeUITests: XCTestCase {
    // Declaration of app
    var app: XCUIApplication!
    
    /// Reset state before each test method in a test case is called
    override func setUp() {
        // Init of app
        app = XCUIApplication()
        app.launch()
    }
    
    /// Testing the button 0
    func testButton0() {
        // When
        app.buttons["0"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "0")
    }
    
    /// Testing the button 1
    func testButton1() {
        // When
        app.buttons["1"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "1")
    }
    
    /// Testing the button 2
    func testButton2() {
        // When
        app.buttons["2"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "2")
    }
    
    /// Testing the button 3
    func testButton3() {
        // When
        app.buttons["3"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "3")
    }
    
    /// Testing the button 4
    func testButton4() {
        // When
        app.buttons["4"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "4")
    }
    
    /// Testing the button 5
    func testButton5() {
        // When
        app.buttons["5"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "5")
    }
    
    /// Testing the button 6
    func testButton6() {
        // When
        app.buttons["6"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "6")
    }
    
    /// Testing the button 7
    func testButton7() {
        // When
        app.buttons["7"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "7")
    }
    
    /// Testing the button 8
    func testButton8() {
        // When
        app.buttons["8"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "8")
    }
    
    /// Testing the button 9
    func testButton9() {
        // When
        app.buttons["9"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "9")
    }
    
    /// Testing the button minus
    func testButtonMinus() {
        // When
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "3-")
    }
    
    /// Testing the button plus
    func testButtonPlus() {
        // When
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "3+")
    }
    
    /// Testing the button equal
    func testButtonEqual() {
        // When
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "3+3=6")
    }
    
    /// Testing the button all clear
    func testButtonAllClear() {
        // When
        app.buttons["3"].tap()
        app.buttons["AC"].tap()
        
        // Then
        XCTAssertEqual(app.textViews["textView"].value as! String, "")
    }
    
    /// Testing 3 alerts
    func testAlerts() {
        let alert = app.alerts["Zéro!"]
        
        // When
        app.buttons["-"].tap()
        // Then
        XCTAssert(alert.staticTexts["Expression incorrecte !"].exists)
        // When
        alert.buttons["OK"].tap()
        // Then
        XCTAssertFalse(alert.staticTexts["Expression incorrecte !"].exists)
        
        // When
        app.buttons["="].tap()
        // Then
        XCTAssert(alert.staticTexts["Démarrez un nouveau calcul !"].exists)
        // When
        alert.buttons["OK"].tap()
        // Then
        XCTAssertFalse(alert.staticTexts["Démarrez un nouveau calcul !"].exists)
        
        // When
        app.buttons["9"].tap()
        app.buttons["-"].tap()
        app.buttons["="].tap()
        // Then
        XCTAssert(alert.staticTexts["Entrez une expression correcte !"].exists)
        // When
        alert.buttons["OK"].tap()
        // Then
        XCTAssertFalse(alert.staticTexts["Entrez une expression correcte !"].exists)
    }
}
