//
//  Calculator.swift
//  CountOnMe
//
//  Created by Jerome Krakus on 09/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculator {
    // MARK: - Properties
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var total = 0
    
    // Computed property for toggle alerts
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    // Computed property for checking if can add operator
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    // MARK: - Methods
    /// Adding new number in stringNumbers array
    ///
    /// - parameter newNumber : It's the number you tapped
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    /// Adding operator +
    func plus() {
        operators.append("+")
        stringNumbers.append("")
    }

    /// Adding operator -
    func minus() {
        operators.append("-")
        stringNumbers.append("")
    }
    
    /// Calcule total
    func calculeTotal() {
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
    }
    
    /// Reset the properties of Calculator
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        total = 0
    }
    
}
