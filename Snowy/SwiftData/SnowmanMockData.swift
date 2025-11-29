//
//  SnowmanMockData.swift
//  Snowy
//
//  Created by Evan Plant on 29/11/2025.
//

import Foundation
import SwiftData

@MainActor
let mockContainer: ModelContainer = {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SnowmanItem.self, configurations: config)

    let snowmen: [SnowmanItem] = [
        SnowmanItem(
            snowmanName: "Frosty",
            creationDate: .now.addingTimeInterval(-3600),
            ball0Showing: true,
            ball1Showing: true,
            ball2Showing: true,
            ball0Size: 125,
            ball1Size: 100,
            ball2Size: 75,
            ballColourIndex: 8,
            ballStyle: 0,
            showingButtons: true,
            buttonStyle: 0,
            buttonColourIndex: 9,
            buttonCount: 3,
            showingEyes: true,
            eyeStyle: 1,
            eyeColourIndex: 9,
            showingNose: true,
            noseStyle: 1,
            noseColourIndex: 1,
            backgroundColourIndex: 9
        ),
        SnowmanItem(
            snowmanName: "Snowy",
            creationDate: .now.addingTimeInterval(-7200),
            ball0Showing: true,
            ball1Showing: true,
            ball2Showing: true,
            ball0Size: 130,
            ball1Size: 110,
            ball2Size: 60,
            ballColourIndex: 7,
            ballStyle: 1,
            showingButtons: false,
            buttonStyle: 0,
            buttonColourIndex: 3,
            buttonCount: 2,
            showingEyes: true,
            eyeStyle: 0,
            eyeColourIndex: 0,
            showingNose: true,
            noseStyle: 0,
            noseColourIndex: 2,
            backgroundColourIndex: 5
        )
    ]

    for snowman in snowmen {
        container.mainContext.insert(snowman)
    }

    return container
}()
