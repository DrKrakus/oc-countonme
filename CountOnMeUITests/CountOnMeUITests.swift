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
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    
    func testButton0() {
        let textView = app.textViews["textView"]

        app.buttons["0"].tap()

        XCTAssertEqual(textView.value as! String, "0")
    }
    
    func testButton1() {
        let textView = app.textViews["textView"]
        
        app.buttons["1"].tap()
        
        XCTAssertEqual(textView.value as! String, "1")
    }
    
    func testButton2() {
        let textView = app.textViews["textView"]
        
        app.buttons["2"].tap()
        
        XCTAssertEqual(textView.value as! String, "2")
    }
    
    func testButton3() {
        let textView = app.textViews["textView"]
        
        app.buttons["3"].tap()
        
        XCTAssertEqual(textView.value as! String, "3")
    }
    
    func testButton4() {
        let textView = app.textViews["textView"]
        
        app.buttons["4"].tap()
        
        XCTAssertEqual(textView.value as! String, "4")
    }
    
    func testButton5() {
        let textView = app.textViews["textView"]
        
        app.buttons["5"].tap()
        
        XCTAssertEqual(textView.value as! String, "5")
    }
    
    func testButton6() {
        let textView = app.textViews["textView"]
        
        app.buttons["6"].tap()
        
        XCTAssertEqual(textView.value as! String, "6")
    }
    
    func testButton7() {
        let textView = app.textViews["textView"]
        
        app.buttons["7"].tap()
        
        XCTAssertEqual(textView.value as! String, "7")
    }
    
    func testButton8() {
        let textView = app.textViews["textView"]
        
        app.buttons["8"].tap()
        
        XCTAssertEqual(textView.value as! String, "8")
    }
    
    func testButton9() {
        let textView = app.textViews["textView"]
        
        app.buttons["9"].tap()
        
        XCTAssertEqual(textView.value as! String, "9")
    }
    
    func testButtonMinus() {
        let textView = app.textViews["textView"]
        
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        
        XCTAssertEqual(textView.value as! String, "3-")
    }
    
    func testButtonPlus() {
        let textView = app.textViews["textView"]
        
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        
        XCTAssertEqual(textView.value as! String, "3+")
    }
    
    func testButtonEqual() {
        let textView = app.textViews["textView"]
        
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(textView.value as! String, "3+3=6")
    }
    
    func testButtonAllClear() {
        let textView = app.textViews["textView"]
        
        app.buttons["3"].tap()
        app.buttons["AC"].tap()
        
        XCTAssertEqual(textView.value as! String, "")
    }
    
    func testAlerts() {
        let alert = app.alerts["Zéro!"]
        
        app.buttons["-"].tap()
        XCTAssert(alert.staticTexts["Expression incorrecte !"].exists)
        alert.buttons["OK"].tap()
        XCTAssertFalse(alert.staticTexts["Expression incorrecte !"].exists)
        
        app.buttons["="].tap()
        XCTAssert(alert.staticTexts["Démarrez un nouveau calcul !"].exists)
        alert.buttons["OK"].tap()
        XCTAssertFalse(alert.staticTexts["Démarrez un nouveau calcul !"].exists)
        
        app.buttons["9"].tap()
        app.buttons["-"].tap()
        app.buttons["="].tap()
        XCTAssert(alert.staticTexts["Entrez une expression correcte !"].exists)
        alert.buttons["OK"].tap()
        XCTAssertFalse(alert.staticTexts["Entrez une expression correcte !"].exists)
    }
}
