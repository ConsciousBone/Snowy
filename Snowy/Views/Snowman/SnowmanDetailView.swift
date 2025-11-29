//
//  SnowmanDetailView.swift
//  Snowy
//
//  Created by Evan Plant on 29/11/2025.
//

import SwiftUI

struct SnowmanDetailView: View {
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    
    var snowman: SnowmanItem
    
    var body: some View {
        Form {
            Section {
                SnowmanRowView(item: snowman)
                    .padding()
                    .frame(height: 200)
                    .background(accentColours[snowman.backgroundColourIndex])
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            Section {
                Text(snowman.snowmanName)
                    .font(.headline)
                    .padding(.horizontal, 5)
                    .padding(.top, 2)
                Text("Created on \(snowman.creationDate.formatted(date: .long, time: .shortened))")
                    .padding(.horizontal, 5)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Section {
                Button {
                    print("editing snowman")
                } label: {
                    Label("Edit \(snowman.snowmanName)", systemImage: "pencil")
                }
            }
        }
        .navigationTitle(snowman.snowmanName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
