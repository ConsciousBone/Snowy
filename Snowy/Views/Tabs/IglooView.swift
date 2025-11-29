//
//  IglooView.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import SwiftUI
import SwiftData

struct IglooView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \SnowmanItem.creationDate, order: .reverse) var snowmanItems: [SnowmanItem]
    
    @State private var showingAddSheet = false
    
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    
    var body: some View {
        NavigationStack {
            if snowmanItems.isEmpty {
                ContentUnavailableView {
                    Label("No snowmen", systemImage: "snow")
                } description: {
                    Text("You haven't added any snowmen to your igloo.")
                } actions: {
                    Button {
                        print("showing add popup")
                        showingAddSheet.toggle()
                    } label: {
                        Label("Create a snowman", systemImage: "plus")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .navigationTitle("My Igloo")
                .navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $showingAddSheet) {
                    NavigationStack {
                        SnowmanCreationView()
                    }
                }
            } else {
                Form {
                    ForEach(snowmanItems) { snowman in
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
                    .onDelete { indexSet in
                        withAnimation {
                            indexSet
                                .map{snowmanItems[$0]}
                                .forEach(modelContext.delete)
                        }
                    }
                }
                .navigationTitle("My Igloo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            print("showing add sheet")
                            showingAddSheet.toggle()
                        } label: {
                            Label("Add", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddSheet) {
                    NavigationStack {
                        SnowmanCreationView()
                    }
                }
            }
        }
    }
}

#Preview {
    IglooView()
        .modelContainer(mockContainer)
}
