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
    var ballColourIndex: Int
    
    var showingButtons: Bool
    //var buttonStyle: Int // 0 circle, 1 square, 2 triangle
    var buttonColourIndex: Int
    
    var showingEyes: Bool
    //var eyeStyle: Int // 0 circle, 1 square, 2 triangle
    var eyeColourIndex: Int
    
    var showingHat: Bool
    var hatColourIndex: Int
    
    var showingNose: Bool
    //var noseStyle: Int // 0 circle, 1 square, 2 triangle
    var noseColourIndex: Int
    
    var id = UUID()
    
    init(
        snowmanName: String,
        creationDate: Date,
        ball0Size: Double,
        ball1Size: Double,
        ball2Size: Double,
        ballColourIndex: Int,
        showingButtons: Bool,
        //buttonStyle: Int,
        buttonColourIndex: Int,
        showingEyes: Bool,
        //eyeStyle: Int,
        eyeColourIndex: Int,
        showingHat: Bool,
        hatColourIndex: Int,
        showingNose: Bool,
        //noseStyle: Int,
        noseColourIndex: Int,
        id: UUID = UUID()
    ) {
        self.snowmanName = snowmanName
        self.creationDate = creationDate
        self.ball0Size = ball0Size
        self.ball1Size = ball1Size
        self.ball2Size = ball2Size
        self.ballColourIndex = ballColourIndex
        self.showingButtons = showingButtons
        //self.buttonStyle = buttonStyle
        self.buttonColourIndex = buttonColourIndex
        self.showingEyes = showingEyes
        //self.eyeStyle = eyeStyle
        self.eyeColourIndex = eyeColourIndex
        self.showingHat = showingHat
        self.hatColourIndex = hatColourIndex
        self.showingNose = showingNose
        //self.noseStyle = noseStyle
        self.noseColourIndex = noseColourIndex
        self.id = id
    }
}
