//
//  SnowmanCreationView.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import SwiftUI

struct SnowmanCreationView: View {
    @State private var ball0Size: Double = 125
    @State private var ball1Size: Double = 100
    @State private var ball2Size: Double = 75
    
    
    var body: some View {
        Text("Snowman creation view")
        VStack(spacing: 0) {
            Circle()
                .foregroundStyle(.white.gradient)
                .frame(width: ball2Size)
            Circle()
                .foregroundStyle(.white.gradient)
                .frame(width: ball1Size)
            Circle()
                .foregroundStyle(.white.gradient)
                .frame(width: ball0Size)
        }
        .padding()
        .background(Color(.systemFill))
        
        VStack {
            Slider(
                value: $ball2Size,
                in: 50...150,
                step: 1.0,
                label: { Text("a") },
                minimumValueLabel: { Text("a") },
                maximumValueLabel: { Text("b") }
            )
            Slider(
                value: $ball1Size,
                in: 50...150,
                step: 1.0,
                label: { Text("a") },
                minimumValueLabel: { Text("a") },
                maximumValueLabel: { Text("b") }
            )
            Slider(
                value: $ball0Size,
                in: 50...150,
                step: 1.0,
                label: { Text("a") },
                minimumValueLabel: { Text("a") },
                maximumValueLabel: { Text("b") }
            )
        }
    }
}

#Preview {
    SnowmanCreationView()
}
