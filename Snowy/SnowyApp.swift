//
//  SnowyApp.swift
//  Snowy
//
//  Created by Evan Plant on 24/11/2025.
//

import SwiftUI
import SwiftData

@main
struct SnowyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [SnowmanItem.self])
        }
    }
}
