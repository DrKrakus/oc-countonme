//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    let calculator = Calculator()

    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action
    /// Update display for showing the tapped number
    ///
    /// - parameter sender: the tapped button
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculator.addNewNumber(i)
                updateDisplay()
            }
        }
    }

    /// Check if can add the operator +, then add him
    @IBAction func plus() {
        if checkIfCanAddOperator() {
            calculator.plus()
            updateDisplay()
        }
    }

    /// Check if can add the operator -, then add him
    @IBAction func minus() {
        if checkIfCanAddOperator() {
            calculator.minus()
            updateDisplay()
        }
    }

    /// Check if can add the operator =, then make the calcul and update display
    @IBAction func equal() {
        if !checkIfIsExpressionCorrect() {
            return
        }
        calculator.calculeTotal()
        textView.text = textView.text + "=\(calculator.total)"
        // Reset the properties, and make the calculator ready for an another calcul
        calculator.clear()
    }

    /// Clear all the calcul
    @IBAction func allClear() {
        calculator.clear()
        updateDisplay()
    }
    
    // MARK: - Methods
    /// Check if can add operator, and alert the user when error appears
    func checkIfCanAddOperator() -> Bool {
        if !calculator.canAddOperator {
            let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    /// Check if the button tapped is correct, and alert the user when error appears
    func checkIfIsExpressionCorrect() -> Bool {
        if !calculator.isExpressionCorrect {
            if calculator.stringNumbers.count == 1 {
                let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            } else {
                let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            }
            return false
        }
        return true
    }
    
    /// Update the UITextView
    func updateDisplay() {
        var text = ""
        for (i, stringNumber) in calculator.stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += calculator.operators[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
}
