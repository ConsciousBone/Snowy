//
//  ContentView.swift
//  Snowy
//
//  Created by Evan Plant on 24/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            
            Tab("My Igloo", systemImage: "snowflake") {
                IglooView()
            }
            
            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                SearchView(searchText: $searchText)
            }
        }
    }
}

#Preview {
    ContentView()
}
