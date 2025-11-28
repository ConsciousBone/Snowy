//
//  SearchView.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        NavigationStack {
            Text("Search view")
            Text("searching for: \(searchText)")
        }
        .searchable(
            text: $searchText,
            prompt: "Search your igloo"
        )
    }
}

#Preview {
    SearchView(searchText: .constant("text"))
}
