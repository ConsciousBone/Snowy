//
//  SnowmanEditView.swift
//  Snowy
//
//  Created by Evan Plant on 29/11/2025.
//

import SwiftUI
import SwiftData

struct SnowmanEditView: View {
    @FocusState var isInputActive: Bool
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.modelContext) var modelContext
    
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    let accentColourNames = [
        "Red", "Orange",
        "Yellow", "Green",
        "Mint", "Blue",
        "Purple", "Brown",
        "White", "Black"
    ]
    
    @State private var snowmanName = "Frosty"
    
    @State private var ball0Showing = true
    @State private var ball1Showing = true
    @State private var ball2Showing = true
    
    @State private var ball0Size: Double = 125
    @State private var ball1Size: Double = 100
    @State private var ball2Size: Double = 75
    @State private var ballColourIndex = 8
    @State private var ballStyle = 0 // 0 circle, 1 square
    
    @State private var showingButtons = true
    @State private var buttonStyle = 0 // 0 circle, 1 square
    @State private var buttonColourIndex = 9
    @State private var buttonCount: Double = 3
    
    let styles = ["Circle", "Square"]
    
    @State private var showingEyes = true
    @State private var eyeStyle = 0 // 0 circle, 1 square
    @State private var eyeColourIndex = 9
    
    @State private var showingNose = true
    @State private var noseStyle = 0 // 0 circle, 1 square
    @State private var noseColourIndex = 1
    
    @State private var backgroundColourIndex = 9
    
    @State private var selectedControlSection = 0
    
    var snowman: SnowmanItem
    
    var body: some View {
        VStack(spacing: 0) {
            SnowmanPreviewView(
                ball0Showing: ball0Showing,
                ball1Showing: ball1Showing,
                ball2Showing: ball2Showing,
                ball0Size: ball0Size,
                ball1Size: ball1Size,
                ball2Size: ball2Size,
                ballColourIndex: ballColourIndex,
                ballStyle: ballStyle,
                showingButtons: showingButtons,
                buttonStyle: buttonStyle,
                buttonColourIndex: buttonColourIndex,
                buttonCount: buttonCount,
                showingEyes: showingEyes,
                eyeStyle: eyeStyle,
                eyeColourIndex: eyeColourIndex,
                showingNose: showingNose,
                noseStyle: noseStyle,
                noseColourIndex: noseColourIndex,
                backgroundColourIndex: backgroundColourIndex
            )
            .frame(maxHeight: UIScreen.main.bounds.height / 3) // 1/3 of screen
            .padding()
            .background(accentColours[backgroundColourIndex])
            
            Picker("Control section", selection: $selectedControlSection) {
                Text("General").tag(0)
                Text("Face").tag(1)
                Text("Body").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()
            .background(Color(.systemGroupedBackground))
            
            Form {
                if selectedControlSection == 0 { // general
                    Section {
                        TextField(text: $snowmanName) {
                            Text("Name")
                        }
                        .focused($isInputActive)
                    } header: {
                        Text("Snowman name")
                    }
                    
                    Section {
                        Picker(selection: $backgroundColourIndex) {
                            ForEach(accentColours.indices, id: \.self) { index in
                                Text(accentColourNames[index])
                            }
                        } label: {
                            Text("Background colour")
                        }
                    }
                }
                
                if selectedControlSection == 1 { // face
                    Section {
                        Toggle(isOn: $showingEyes) {
                            Text("Eyes")
                        }
                        Toggle(isOn: $showingNose) {
                            Text("Nose")
                        }
                    } header: {
                        Text("Visibility")
                    }
                    
                    Section {
                        Picker(selection: $eyeStyle) {
                            ForEach(styles.indices, id: \.self) { index in
                                Text(styles[index])
                            }
                        } label: {
                            Text("Eye style")
                        }

                        Picker(selection: $noseStyle) {
                            ForEach(styles.indices, id: \.self) { index in
                                Text(styles[index])
                            }
                        } label: {
                            Text("Nose style")
                        }
                    }
                    
                    Section {
                        Picker(selection: $eyeColourIndex) {
                            ForEach(accentColours.indices, id: \.self) { index in
                                Text(accentColourNames[index])
                            }
                        } label: {
                            Text("Eye colour")
                        }
                        
                        Picker(selection: $noseColourIndex) {
                            ForEach(accentColours.indices, id: \.self) { index in
                                Text(accentColourNames[index])
                            }
                        } label: {
                            Text("Nose colour")
                        }
                    }
                }
                
                if selectedControlSection == 2 { // body
                    Section {
                        Picker(selection: $ballColourIndex) {
                            ForEach(accentColours.indices, id: \.self) { index in
                                Text(accentColourNames[index])
                            }
                        } label: {
                            Text("Ball colour")
                        }
                        Picker(selection: $buttonColourIndex) {
                            ForEach(accentColours.indices, id: \.self) { index in
                                Text(accentColourNames[index])
                            }
                        } label: {
                            Text("Button colour")
                        }
                    }
                    
                    Section {
                        Picker(selection: $ballStyle) {
                            ForEach(styles.indices, id: \.self) { index in
                                Text(styles[index])
                            }
                        } label: {
                            Text("Ball style")
                        }
                        
                        Picker(selection: $buttonStyle) {
                            ForEach(styles.indices, id: \.self) { index in
                                Text(styles[index])
                            }
                        } label: {
                            Text("Button style")
                        }
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
                        if ball1Showing {
                            Toggle(isOn: $showingButtons) {
                                Text("Buttons")
                            }
                        }
                    } header: {
                        Text("Visibility")
                    }
                    
                    if ball2Showing {
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
                    }
                    
                    if ball1Showing {
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
                    }
                    
                    if ball0Showing {
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
                    }
                    
                    if showingButtons && ball1Showing {
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
            }
            .onAppear {
                snowmanName = snowman.snowmanName
                ball0Showing = snowman.ball0Showing
                ball1Showing = snowman.ball1Showing
                ball2Showing = snowman.ball2Showing
                ball0Size = snowman.ball0Size
                ball1Size = snowman.ball1Size
                ball2Size = snowman.ball2Size
                ballColourIndex = snowman.ballColourIndex
                ballStyle = snowman.ballStyle
                showingButtons = snowman.showingButtons
                buttonStyle = snowman.buttonStyle
                buttonColourIndex = snowman.buttonColourIndex
                buttonCount = snowman.buttonCount
                showingEyes = snowman.showingEyes
                eyeStyle = snowman.eyeStyle
                eyeColourIndex = snowman.eyeColourIndex
                showingNose = snowman.showingNose
                noseStyle = snowman.noseStyle
                noseColourIndex = snowman.noseColourIndex
                backgroundColourIndex = snowman.backgroundColourIndex
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        print("saving snowman")
                        
                        snowman.snowmanName = snowmanName
                        snowman.ball0Showing = ball0Showing
                        snowman.ball1Showing = ball1Showing
                        snowman.ball2Showing = ball2Showing
                        snowman.ball0Size = ball0Size
                        snowman.ball1Size = ball1Size
                        snowman.ball2Size = ball2Size
                        snowman.ballColourIndex = ballColourIndex
                        snowman.ballStyle = ballStyle
                        snowman.showingButtons = showingButtons
                        snowman.buttonStyle = buttonStyle
                        snowman.buttonColourIndex = buttonColourIndex
                        snowman.buttonCount = buttonCount
                        snowman.showingEyes = showingEyes
                        snowman.eyeStyle = eyeStyle
                        snowman.eyeColourIndex = eyeColourIndex
                        snowman.showingNose = showingNose
                        snowman.noseStyle = noseStyle
                        snowman.noseColourIndex = noseColourIndex
                        snowman.backgroundColourIndex = backgroundColourIndex
                        
                        try? modelContext.save()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("Save", systemImage: "checkmark")
                    }
                    .disabled(snowmanName.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        print("closing sheet")
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("Close", systemImage: "xmark")
                    }
                }
                
                ToolbarItem(placement: .keyboard) {
                    Button {
                        isInputActive = false
                    } label: {
                        Label("Close keyboard", systemImage: "keyboard.chevron.compact.down")
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
}
