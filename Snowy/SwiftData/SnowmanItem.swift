//
//  SnowmanItem.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import Foundation
import SwiftData

@Model class SnowmanItem {
    var snowmanName: String
    var creationDate: Date
    
    var ball0Size: Double
    var ball1Size: Double
    var ball2Size: Double
    
    var buttonCount: Int
    var buttonStyle: Int // 0 circle, 1 square
    
    var showingHat: Bool
    var hatColourIndex: Int
    
    var showingNose: Bool
    var noseStyleIndex: Int // 0 circle, 1 square
    var noseColourIndex: Int
    
    var id = UUID()
    
    init(
        snowmanName: String,
        creationDate: Date,
        ball0Size: Double,
        ball1Size: Double,
        ball2Size: Double,
        buttonCount: Int,
        buttonStyle: Int,
        showingHat: Bool,
        hatColourIndex: Int,
        showingNose: Bool,
        noseStyleIndex: Int,
        noseColourIndex: Int,
        id: UUID = UUID()
    ) {
        self.snowmanName = snowmanName
        self.creationDate = creationDate
        
        self.ball0Size = ball0Size
        self.ball1Size = ball1Size
        self.ball2Size = ball2Size
        
        self.buttonCount = buttonCount
        self.buttonStyle = buttonStyle
        
        self.showingHat = showingHat
        self.hatColourIndex = hatColourIndex
        
        self.showingNose = showingNose
        self.noseStyleIndex = noseStyleIndex
        self.noseColourIndex = noseColourIndex
        
        self.id = id
    }
}
