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
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculator.addNewNumber(i)
                updateDisplay()
            }
        }
    }
    
    @IBAction func plus() {
        if checkIfCanAddOperator() {
            calculator.plus()
            updateDisplay()
        }
    }
    
    @IBAction func minus() {
        if checkIfCanAddOperator() {
            calculator.minus()
            updateDisplay()
        }
    }
    
    @IBAction func equal() {
        if !checkIfIsExpressionCorrect() {
            return
        }
        calculator.calculeTotal()
        textView.text = textView.text + "=\(calculator.total)"
        calculator.clear()
    }
    
    @IBAction func allClear() {
        calculator.clear()
        updateDisplay()
    }
    
    // MARK: - Methods
    func checkIfCanAddOperator() -> Bool {
        if !calculator.canAddOperator {
            let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        return true
    }
    
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
