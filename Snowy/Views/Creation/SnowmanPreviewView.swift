//
//  SnowmanView.swift
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
    
    @Binding var ball0Size: Double
    @Binding var ball1Size: Double
    @Binding var ball2Size: Double
    @Binding var ballColourIndex: Int
    
    @Binding var showingButtons: Bool
    @Binding var buttonStyle: Int // 0 circle, 1 square, 2 triangle
    @Binding var buttonColourIndex: Int
    
    @Binding var showingEyes: Bool
    @Binding var eyeStyle: Int // 0 circle, 1 square, 2 triangle
    @Binding var eyeColourIndex: Int
    
    @Binding var showingHat: Bool
    @Binding var hatColourIndex: Int
    
    @Binding var showingNose: Bool
    @Binding var noseStyleIndex: Int // 0 circle, 1 square, 2 triangle
    @Binding var noseColourIndex: Int
    
    var body: some View {
        VStack(spacing: 0) {
            
        }
        .background(Color(.secondarySystemFill))
    }
}
