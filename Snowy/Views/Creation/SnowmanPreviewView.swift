//
//  SnowmanPreviewView.swift
//  Snowy
//
//  Created by Evan Plant on 28/11/2025.
//

import SwiftUI

struct SnowmanPreviewView: View {
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    
    @Binding var ball0Showing: Bool
    @Binding var ball1Showing: Bool
    @Binding var ball2Showing: Bool
    
    @Binding var ball0Size: Double
    @Binding var ball1Size: Double
    @Binding var ball2Size: Double
    @Binding var ballColourIndex: Int
    
    @Binding var showingButtons: Bool
    //@Binding var buttonStyle: Int // 0 circle, 1 square, 2 triangle
    @Binding var buttonColourIndex: Int
    @Binding var buttonCount: Double
    
    @Binding var showingEyes: Bool
    //@Binding var eyeStyle: Int // 0 circle, 1 square, 2 triangle
    @Binding var eyeColourIndex: Int
    
    //@Binding var showingHat: Bool
    //@Binding var hatColourIndex: Int
    
    @Binding var showingNose: Bool
    //@Binding var noseStyle: Int // 0 circle, 1 square, 2 triangle
    @Binding var noseColourIndex: Int
    
    @Binding var backgroundColourIndex: Int
    
    var body: some View {
        GeometryReader { geo in
            let naturalWidth = max(
                ball0Showing ? ball0Size : 0,
                ball1Showing ? ball1Size : 0,
                ball2Showing ? ball2Size : 0
            )
            let naturalHeight =
                (ball2Showing ? ball2Size : 0) +
                (ball1Showing ? ball1Size : 0) +
                (ball0Showing ? ball0Size : 0)
            
            let safeWidth = max(naturalWidth, 1)
            let safeHeight = max(naturalHeight, 1)
            
            let scale = min(
                1,
                min(geo.size.width / safeWidth,
                    geo.size.height / safeHeight)
            )
            
            VStack(spacing: 0) {
                if ball2Showing {
                    Circle()
                        .foregroundStyle(accentColours[ballColourIndex])
                        .frame(width: ball2Size, height: ball2Size)
                        .overlay {
                            VStack {
                                if showingEyes {
                                    HStack {
                                        Circle()
                                            .foregroundStyle(accentColours[eyeColourIndex])
                                            .frame(width: ball2Size / 6)
                                        Circle()
                                            .foregroundStyle(accentColours[eyeColourIndex])
                                            .frame(width: ball2Size / 6)
                                    }
                                }
                                
                                if showingNose {
                                    Circle()
                                        .foregroundStyle(accentColours[noseColourIndex])
                                        .frame(width: ball2Size / 4)
                                }
                            }
                        }
                }
                
                if ball1Showing {
                    Circle()
                        .foregroundStyle(accentColours[ballColourIndex])
                        .frame(width: ball1Size, height: ball1Size)
                        .overlay {
                            VStack(spacing: 8) {
                                if showingButtons {
                                    ForEach(0..<Int(buttonCount), id: \.self) { index in
                                        Circle()
                                            .foregroundStyle(accentColours[buttonColourIndex])
                                            .frame(width: ball1Size / 5)
                                    }
                                }
                            }
                            .padding()
                        }
                }
                
                if ball0Showing {
                    Circle()
                        .foregroundStyle(accentColours[ballColourIndex])
                        .frame(width: ball0Size, height: ball0Size)
                }
            }
            .frame(width: naturalWidth, height: naturalHeight)
            .scaleEffect(scale)
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}
