//
//  CalculatorButtonItem.swift
//  Calc
//
//  Created by braindamage on 2022/2/9.
//
import UIKit
import Foundation
///计算器按钮的4种类型
enum CalculatorButtonItem {
    //rawValue
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    //rawValue
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int) //关联值
    case dot
    case op(Op) //关联值
    case command(Command) //关联值
}

///在扩展中定义计算属性---严格意义上这些计算属性定义成ViewModel可能会更好
extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value):
            return "\(value)"
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8 , height: 88)
        }
        return .init(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit , .dot :
            return "digitBackground"
        case .op:
            return "operatorBackground"
        case .command:
            return "operatorBackground"
        }
    }
    
}


///ForEach中的id是需要遵循identifiable协议的
extension CalculatorButtonItem: Hashable {
    
}
