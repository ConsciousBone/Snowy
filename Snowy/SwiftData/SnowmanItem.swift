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
    
    var ball0Showing: Bool
    var ball1Showing: Bool
    var ball2Showing: Bool
    
    var ball0Size: Double
    var ball1Size: Double
    var ball2Size: Double
    var ballColourIndex: Int
    //var ballStyle: Int // 0 circle, 1 square
    
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
    
    var id = UUID()
    
    init(
        snowmanName: String,
        creationDate: Date,
        ball0Showing: Bool,
        ball1Showing: Bool,
        ball2Showing: Bool,
        ball0Size: Double,
        ball1Size: Double,
        ball2Size: Double,
        ballColourIndex: Int,
        //ballStyle: Int
        showingButtons: Bool,
        buttonStyle: Int,
        buttonColourIndex: Int,
        buttonCount: Double,
        showingEyes: Bool,
        eyeStyle: Int,
        eyeColourIndex: Int,
        //showingHat: Bool,
        //hatColourIndex: Int,
        showingNose: Bool,
        //noseStyle: Int,
        noseColourIndex: Int,
        backgroundColourIndex: Int,
        id: UUID = UUID()
    ) {
        self.snowmanName = snowmanName
        self.creationDate = creationDate
        self.ball0Showing = ball0Showing
        self.ball1Showing = ball1Showing
        self.ball2Showing = ball2Showing
        self.ball0Size = ball0Size
        self.ball1Size = ball1Size
        self.ball2Size = ball2Size
        self.ballColourIndex = ballColourIndex
        //self.ballStyle = ballStyle
        self.buttonCount = buttonCount
        self.showingButtons = showingButtons
        self.buttonStyle = buttonStyle
        self.buttonColourIndex = buttonColourIndex
        self.showingEyes = showingEyes
        self.eyeStyle = eyeStyle
        self.eyeColourIndex = eyeColourIndex
        //self.showingHat = showingHat
        //self.hatColourIndex = hatColourIndex
        self.showingNose = showingNose
        //self.noseStyle = noseStyle
        self.noseColourIndex = noseColourIndex
        self.backgroundColourIndex = backgroundColourIndex
        self.id = id
    }
}
