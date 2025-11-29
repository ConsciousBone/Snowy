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
    
    var ball0Showing: Bool
    var ball1Showing: Bool
    var ball2Showing: Bool
    
    var ball0Size: Double
    var ball1Size: Double
    var ball2Size: Double
    var ballColourIndex: Int
    
    var showingButtons: Bool
    var buttonStyle: Int // 0 circle, 1 square
    var buttonColourIndex: Int
    var buttonCount: Double
    
    var showingEyes: Bool
    var eyeStyle: Int // 0 circle, 1 square
    var eyeColourIndex: Int
    
    //var showingHat: Bool
    //var hatColourIndex: Int
    
    var showingNose: Bool
    //var noseStyle: Int // 0 circle, 1 square
    var noseColourIndex: Int
    
    var backgroundColourIndex: Int
    
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
                                        if eyeStyle == 1 { // square
                                            Rectangle()
                                                .foregroundStyle(accentColours[eyeColourIndex])
                                                .frame(width: ball2Size / 7, height: ball2Size / 7)
                                            Rectangle()
                                                .foregroundStyle(accentColours[eyeColourIndex])
                                                .frame(width: ball2Size / 7, height: ball2Size / 7)
                                        } else { // circle
                                            Circle()
                                                .foregroundStyle(accentColours[eyeColourIndex])
                                                .frame(width: ball2Size / 6)
                                            Circle()
                                                .foregroundStyle(accentColours[eyeColourIndex])
                                                .frame(width: ball2Size / 6)
                                        }
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
                                        if buttonStyle == 1 { // square
                                            Rectangle()
                                                .foregroundStyle(accentColours[buttonColourIndex])
                                                .frame(width: ball1Size / 6, height: ball1Size / 6)
                                        } else { // fall back nicely to circle
                                            Circle()
                                                .foregroundStyle(accentColours[buttonColourIndex])
                                                .frame(width: ball1Size / 5)
                                        }
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
