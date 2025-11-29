//
//  SnowmanRowView.swift
//  Snowy
//
//  Created by Evan Plant on 29/11/2025.
//

import SwiftUI

struct SnowmanRowView: View {
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    
    let item: SnowmanItem
    
    var body: some View {
        GeometryReader { geo in
            let naturalWidth = max(
                item.ball0Showing ? item.ball0Size : 0,
                item.ball1Showing ? item.ball1Size : 0,
                item.ball2Showing ? item.ball2Size : 0
            )
            let naturalHeight =
            (item.ball2Showing ? item.ball2Size : 0) +
            (item.ball1Showing ? item.ball1Size : 0) +
            (item.ball0Showing ? item.ball0Size : 0)
            
            let safeWidth = max(naturalWidth, 1)
            let safeHeight = max(naturalHeight, 1)
            
            let scale = min(
                1,
                min(geo.size.width / safeWidth,
                    geo.size.height / safeHeight)
            )
            
            VStack(spacing: 0) {
                if item.ball2Showing {
                    if item.ballStyle == 1 { // square
                        Rectangle()
                            .foregroundStyle(accentColours[item.ballColourIndex])
                            .frame(width: item.ball2Size, height: item.ball2Size)
                            .overlay {
                                VStack {
                                    if item.showingEyes {
                                        HStack {
                                            if item.eyeStyle == 1 { // square
                                                Rectangle()
                                                    .foregroundStyle(accentColours[item.eyeColourIndex])
                                                    .frame(width: item.ball2Size / 7, height: item.ball2Size / 7)
                                                Rectangle()
                                                    .foregroundStyle(accentColours[item.eyeColourIndex])
                                                    .frame(width: item.ball2Size / 7, height: item.ball2Size / 7)
                                            } else { // circle
                                                Circle()
                                                    .foregroundStyle(accentColours[item.eyeColourIndex])
                                                    .frame(width: item.ball2Size / 6)
                                                Circle()
                                                    .foregroundStyle(accentColours[item.eyeColourIndex])
                                                    .frame(width: item.ball2Size / 6)
                                            }
                                        }
                                    }
                                    
                                    if item.showingNose {
                                        if item.noseStyle == 1 { // square
                                            Rectangle()
                                                .foregroundStyle(accentColours[item.noseColourIndex])
                                                .frame(width: item.ball2Size / 5, height: item.ball2Size / 5)
                                        } else { // circle
                                            Circle()
                                                .foregroundStyle(accentColours[item.noseColourIndex])
                                                .frame(width: item.ball2Size / 4)
                                        }
                                    }
                                }
                            }
                    } else { // circle
                        Circle()
                            .foregroundStyle(accentColours[item.ballColourIndex])
                            .frame(width: item.ball2Size, height: item.ball2Size)
                            .overlay {
                                VStack {
                                    if item.showingEyes {
                                        HStack {
                                            if item.eyeStyle == 1 { // square
                                                Rectangle()
                                                    .foregroundStyle(accentColours[item.eyeColourIndex])
                                                    .frame(width: item.ball2Size / 7, height: item.ball2Size / 7)
                                                Rectangle()
                                                    .foregroundStyle(accentColours[item.eyeColourIndex])
                                                    .frame(width: item.ball2Size / 7, height: item.ball2Size / 7)
                                            } else { // circle
                                                Circle()
                                                    .foregroundStyle(accentColours[item.eyeColourIndex])
                                                    .frame(width: item.ball2Size / 6)
                                                Circle()
                                                    .foregroundStyle(accentColours[item.eyeColourIndex])
                                                    .frame(width: item.ball2Size / 6)
                                            }
                                        }
                                    }
                                    
                                    if item.showingNose {
                                        if item.noseStyle == 1 { // square
                                            Rectangle()
                                                .foregroundStyle(accentColours[item.noseColourIndex])
                                                .frame(width: item.ball2Size / 5, height: item.ball2Size / 5)
                                        } else { // circle
                                            Circle()
                                                .foregroundStyle(accentColours[item.noseColourIndex])
                                                .frame(width: item.ball2Size / 4)
                                        }
                                    }
                                }
                            }
                    }
                }
                
                if item.ball1Showing {
                    if item.ballStyle == 1 { // square
                        Rectangle()
                            .foregroundStyle(accentColours[item.ballColourIndex])
                            .frame(width: item.ball1Size, height: item.ball1Size)
                            .overlay {
                                VStack(spacing: 8) {
                                    if item.showingButtons {
                                        ForEach(0..<Int(item.buttonCount), id: \.self) { index in
                                            if item.buttonStyle == 1 { // square
                                                Rectangle()
                                                    .foregroundStyle(accentColours[item.buttonColourIndex])
                                                    .frame(width: item.ball1Size / 6, height: item.ball1Size / 6)
                                            } else { // fall back nicely to circle
                                                Circle()
                                                    .foregroundStyle(accentColours[item.buttonColourIndex])
                                                    .frame(width: item.ball1Size / 5)
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                    } else { // circle
                        Circle()
                            .foregroundStyle(accentColours[item.ballColourIndex])
                            .frame(width: item.ball1Size, height: item.ball1Size)
                            .overlay {
                                VStack(spacing: 8) {
                                    if item.showingButtons {
                                        ForEach(0..<Int(item.buttonCount), id: \.self) { index in
                                            if item.buttonStyle == 1 { // square
                                                Rectangle()
                                                    .foregroundStyle(accentColours[item.buttonColourIndex])
                                                    .frame(width: item.ball1Size / 6, height: item.ball1Size / 6)
                                            } else { // fall back nicely to circle
                                                Circle()
                                                    .foregroundStyle(accentColours[item.buttonColourIndex])
                                                    .frame(width: item.ball1Size / 5)
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                    }
                }
                
                if item.ball0Showing {
                    if item.ballStyle == 1 { // square
                        Rectangle()
                            .foregroundStyle(accentColours[item.ballColourIndex])
                            .frame(width: item.ball0Size, height: item.ball0Size)
                    } else { // circle
                        Circle()
                            .foregroundStyle(accentColours[item.ballColourIndex])
                            .frame(width: item.ball0Size, height: item.ball0Size)
                    }
                }
            }
            .frame(width: naturalWidth, height: naturalHeight)
            .scaleEffect(scale)
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}
