//
//  ContentView.swift
//  Calc
//
//  Created by braindamage on 2022/2/7.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .lineLimit(1)
                .padding(.trailing, 24)
                .minimumScaleFactor(0.5)
                .frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .trailing)
            CalculatorButtonPad()
                .padding(.bottom)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButton: View {
    let fontSize:CGFloat = 38
    let title:String
    let size:CGSize
    let forgroundColor:Color = .white
    let backgroundColorName:String
    let action:()->Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(forgroundColor)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}


struct CalculatorButtonRow: View {
    
    let row:[CalculatorButtonItem]
    var body: some View {
        HStack(spacing: 8) {
            ForEach(row,id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print(item.title)
                }
            }
        }
    }
    
}


struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.divide)],
        [.digit(7),.digit(8),.digit(9),.op(.multiply)],
        [.digit(4),.digit(5),.digit(6),.op(.minus)],
        [.digit(1),.digit(2),.digit(3),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad,id: \.self) { item in
                CalculatorButtonRow(row: item)
            }
        }
    }
}
