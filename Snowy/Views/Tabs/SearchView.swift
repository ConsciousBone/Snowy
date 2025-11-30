//
//  SearchView.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \SnowmanItem.creationDate, order: .reverse) var snowmanItems: [SnowmanItem]
    
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    
    private var filteredSnowmen: [SnowmanItem] {
        guard !searchText.isEmpty else {
            return snowmanItems
        }
        
        return snowmanItems.filter { item in
            item.snowmanName.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    @Binding var searchText: String
    
    var body: some View {
        NavigationStack {
            if filteredSnowmen.isEmpty {
                ContentUnavailableView {
                    Label("No results", systemImage: "magnifyingglass")
                } description: {
                    Text("Try searching something else!")
                }
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                Form {
                    ForEach(filteredSnowmen) { snowman in
                        Section {
                            NavigationLink {
                                SnowmanDetailView(snowman: snowman)
                            } label: {
                                VStack(alignment: .leading) {
                                    SnowmanRowView(item: snowman)
                                        .padding()
                                        .frame(height: 200)
                                        .background(accentColours[snowman.backgroundColourIndex])
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(snowman.snowmanName)
                                                .font(.headline)
                                                .padding(.horizontal, 5)
                                                .padding(.top, 2)
                                            Text("Created on \(snowman.creationDate.formatted(date: .long, time: .shortened))")
                                                .padding(.horizontal, 5)
                                                .font(.subheadline)
                                                .foregroundStyle(.secondary)
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.forward")
                                            .padding(5)
                                            .font(.footnote.bold())
                                            .foregroundStyle(.tertiary)
                                    }
                                }
                            }
                        }
                        .navigationLinkIndicatorVisibility(.hidden)
                        .listRowSeparator(.hidden)
                    }
                }
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
            }
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
