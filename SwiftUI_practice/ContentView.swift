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
    @State var showAlert = false
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    var body: some View {
        NavigationView {
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
                Button(action: {
                    self.showAlert = true
                }) {
                    Text("Hit me button")
                }
                .presentation($showAlert) {
                    Alert(title: Text("Your Score"),message: Text("\(computeScore())"))
                }
                ColorSlider(value: $rGuess, textColor: .red)
                ColorSlider(value: $gGuess, textColor: .green)
                ColorSlider(value: $bGuess, textColor: .blue)
                NavigationLink(destination: photoCollectionView(), label: {
                    Text(" Go to Image Page ")
                        .background(Color.yellow)
                        .font(.system(size: 24))
                        .foregroundColor(Color.white)
                        .cornerRadius(9)
                })
            }
            .navigationBarTitle(Text("Guess Color"))
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

struct ColorSlider : View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        return HStack {
            Text("0").color(textColor)
            Slider(value: $value, from: 0.0, through: 1.0)
            Text("255").color(textColor)
        }.padding()
    }
}
struct Box {
    var id: Int
    let title, imageUrl: String
}

struct photoCollectionView: View {
    
    let boxes: [Box] = [
        Box(id: 1, title: "Surfing", imageUrl: "1"),
        Box(id: 2, title: "Surfboard", imageUrl: "2"),
        Box(id: 3, title: "morning", imageUrl: "3"),
        Box(id: 4, title: "Enjoy", imageUrl: "4"),
        Box(id: 5, title: "morning", imageUrl: "5"),
        Box(id: 6, title: "Enjoy", imageUrl: "6"),
        Box(id: 7, title: "YOLO", imageUrl: "7"),
        Box(id: 8, title: "Summer Time", imageUrl: "8"),
        Box(id: 9, title: "Yayy", imageUrl: "9")

    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(boxes.identified(by: \.id)) { box in
                        BoxView(box: box)
                    }
                }
            }.padding(20)
        }.navigationBarTitle("Surf Pics")
    }
}

struct BoxView: View {
    let box: Box
    
    var body: some View {
        VStack {
            Image(box.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 400)
                .cornerRadius(12)
            
            Text(box.title)
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}
