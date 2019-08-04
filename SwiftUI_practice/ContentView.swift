//
//  ContentView.swift
//  SwiftUI_practice
//
//  Created by 蔡佳宣 on 2019/7/13.
//  Copyright © 2019 蔡佳宣. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    //designate a variable as a @State variable if the UI should update when value change
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    var body: some View {
        VStack {
            HStack {
                //Target Color Block
                VStack {
                    Rectangle()
                        .foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget))
                    Text("Match this Color")
                }
                //Guess Color Block
                VStack {
                    Rectangle()
                        .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess))
                    HStack {
                        Text("R: \(Int(rGuess * 255.0))")
                        Text("G: \(Int(gGuess * 255.0))")
                        Text("B: \(Int(bGuess * 255.0))")
                    }
                }
            }
            VStack {
                Text("Target Color Block")
                Text("Guess Color Block")
            }
            Text("Hit me button")
            HStack {
                Text("0").color(.red)
                Slider(value: $rGuess, from: 0.0, through: 1.0)
                Text("255").color(.red)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}
#endif
