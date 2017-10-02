//
//  calcBrain.swift
//  calculator
//
//  Created by MACi on 20/09/17.
//  Copyright © 2017 raspi. All rights reserved.
//

import Foundation

/* lambda -> siehe var operations
func multiply(val1 : Double, val2 : Double) -> Double {
    return val1 * val2
}
*/

class CalcBrain{
    private var accumulator = 0.0
    private var calcProgramm = [AnyObject]()
    
    func setOperand(operand: Double) {
        accumulator = operand
        calcProgramm.append(operand as AnyObject)
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        // example typeReference
        // swift knows, that BinaryOperation takes two doubles and returns a double
        //"✕" : Operation.BinaryOperation(multiply), // old way
        /*"✕" : Operation.BinaryOperation((val1 : Double, val2 : Double) -> Double {
            return val1 * val2
            }),*/ // inline step 1 (compile error)
        /*"✕" : Operation.BinaryOperation({(val1 : Double, val2 : Double) -> Double in
            return val1 * val2
            }),*/ // inline step 2 (NO compile error)
        /*"✕" : Operation.BinaryOperation({(val1, val2) in return val1 * val2
        }),*/ // inline step 3 (removed all doubles, NO compile error)
        /*"✕" : Operation.BinaryOperation({($0, $1) in return $0 * $1
        }),*/ // inline step 4 default arguments $0 - $n (compile error)
        /*"✕" : Operation.BinaryOperation({return $0 * $1
        }),*/ // inline same as step 4 but with no compile error
        "✕" : Operation.BinaryOperation({ $0 * $1 }), // same as step 4 but return is not needed
        "÷" : Operation.BinaryOperation({ $0 / $1 }),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "-" : Operation.BinaryOperation({ $0 - $1 }),
        "=" : Operation.Equals
    ]
    
    private enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    func performOperation(symbol: String) {
        calcProgramm.append(symbol as AnyObject)
        if let operation = operations[symbol]{
            switch operation{
            case .Constant(let associatedConstantValue):
                accumulator = associatedConstantValue
            case .UnaryOperation(let assoiciatedFunction):
                accumulator = assoiciatedFunction(accumulator)
            case .BinaryOperation(let associatedFunction):
                executePendingBinaryOperation()
                pending = PendingBinaryOperation(binaryFunction: associatedFunction, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    typealias PropertyList = AnyObject // alias anyobject = propertylist
    
    var program: PropertyList {
        get {
            return calcProgramm as CalcBrain.PropertyList
        }
        set {
            clear()
            if let arrayOfOps = newValue as? [AnyObject] {
                for op in arrayOfOps {
                    if let operand = op as? Double {
                        setOperand(operand: operand)
                    } else if let operation = op as? String{
                        performOperation(symbol: operation)
                    }
                }
            }
        }
    }
    
    
    // clears all
    private func clear(){
        calcProgramm.removeAll()
        accumulator = 0.0
        pending = nil
    }
    
    var result : Double {
        get {
            return accumulator
        }
    }
}
