//
//  SnowmanCreationView.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import SwiftUI

struct SnowmanCreationView: View {
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    
    @State private var snowmanName = ""
    
    @State private var ball0Showing = true
    @State private var ball1Showing = true
    @State private var ball2Showing = true
    
    @State private var ball0Size: Double = 125
    @State private var ball1Size: Double = 100
    @State private var ball2Size: Double = 75
    @State private var ballColourIndex = 8
    
    @State private var showingButtons = true
    //@State private var buttonStyle: Int // 0 circle, 1 square, 2 triangle
    @State private var buttonColourIndex = 9
    @State private var buttonCount: Double = 3
    
    @State private var showingEyes = true
    //@State private var eyeStyle: Int // 0 circle, 1 square, 2 triangle
    @State private var eyeColourIndex = 9
    
    @State private var showingHat = false
    @State private var hatColourIndex = 5
    
    @State private var showingNose = true
    //@State private var noseStyle: Int // 0 circle, 1 square, 2 triangle
    @State private var noseColourIndex = 1
    
    var body: some View {
        VStack {
            SnowmanPreviewView(
                ball0Showing: $ball0Showing,
                ball1Showing: $ball1Showing,
                ball2Showing: $ball2Showing,
                ball0Size: $ball0Size,
                ball1Size: $ball1Size,
                ball2Size: $ball2Size,
                ballColourIndex: $ballColourIndex,
                showingButtons: $showingButtons,
                buttonColourIndex: $buttonColourIndex,
                buttonCount: $buttonCount,
                showingEyes: $showingEyes,
                eyeColourIndex: $eyeColourIndex,
                showingHat: $showingHat,
                hatColourIndex: $hatColourIndex,
                showingNose: $showingNose,
                noseColourIndex: $noseColourIndex
            )
            .frame(maxHeight: UIScreen.main.bounds.height / 3) // 1/2 of screen
            .padding()
            
            Form {
                Section {
                    TextField(text: $snowmanName) {
                        Text("Name")
                    }
                } header: {
                    Text("Snowman name")
                }
                
                Section {
                    Toggle(isOn: $ball2Showing) {
                        Text("Top ball")
                    }
                    Toggle(isOn: $ball1Showing) {
                        Text("Middle ball")
                    }
                    Toggle(isOn: $ball0Showing) {
                        Text("Bottom ball")
                    }
                } header: {
                    Text("Ball visibility")
                }
                
                Section {
                    Slider(
                        value: $ball2Size,
                        in: 50...150,
                        label: { Text("Top ball size") },
                        minimumValueLabel: { Text("50") },
                        maximumValueLabel: { Text("150") }
                    )
                } header: {
                    Text("Top ball size: \(ball2Size.formatted(.number.precision(.fractionLength(0))))")
                }
                
                Section {
                    Slider(
                        value: $ball1Size,
                        in: 50...150,
                        label: { Text("Middle ball size") },
                        minimumValueLabel: { Text("50") },
                        maximumValueLabel: { Text("150") }
                    )
                } header: {
                    Text("Middle ball size: \(ball1Size.formatted(.number.precision(.fractionLength(0))))")
                }
                
                Section {
                    Slider(
                        value: $ball0Size,
                        in: 50...150,
                        label: { Text("Bottom ball size") },
                        minimumValueLabel: { Text("50") },
                        maximumValueLabel: { Text("150") }
                    )
                } header: {
                    Text("Bottom ball size: \(ball0Size.formatted(.number.precision(.fractionLength(0))))")
                }
                
                Section {
                    Slider(
                        value: $buttonCount,
                        in: 1...6,
                        step: 1,
                        label: { Text("Button count") },
                        minimumValueLabel: { Text("1") },
                        maximumValueLabel: { Text("6") }
                    )
                } header: {
                    Text("Buttons: \(buttonCount.formatted(.number.precision(.fractionLength(0))))")
                }
            }
        }
        .background(Color(.darkGray))
    }
}

#Preview {
    SnowmanCreationView()
}
