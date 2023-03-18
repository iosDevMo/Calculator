//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by mohamdan on 18/03/2023.
//

import Foundation
struct CalculatorLogic {
    private var number : Double?
    private var intermediateClaculation : (n1: Double, calcMethod: String)?
    
    mutating func setNumber ( _ number : Double ) {
        self.number = number
    }
    
    mutating func calculate ( symbol : String ) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-" :
                return n * -1
            case "AC" :
                return 0
            case "%" :
                return n * 0.01
            case "=" :
                return performTowNumCalculation(n2: n)
            default :
                intermediateClaculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTowNumCalculation ( n2 : Double ) -> Double? {
        if let n1 = intermediateClaculation?.n1,
           let operation = intermediateClaculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                fatalError("the operation passed doesn't match any case!")
            }
        }else {
            return nil
        }
    }
    
}
