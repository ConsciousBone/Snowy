//
//  HomeView.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "Orbit"
    // version stuff, ty searchino!
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
     
    @Query(sort: \SnowmanItem.creationDate, order: .reverse) var snowmanItems: [SnowmanItem]
    
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 3..<12:
            return "Good morning!"
        case 12..<17:
            return "Good afternoon!"
        default:
            return "Good evening!"
        }
    }
    
    var newestSnowman: SnowmanItem? {
        snowmanItems.first
    }
    
    var randomSnowman: SnowmanItem? {
        snowmanItems.randomElement()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text(greeting)
                        .font(.largeTitle)
                } header: {
                    Text("\(appDisplayName) - version \(appVersion) build \(buildNumber)")
                }
                
                if let snowman = newestSnowman {
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
                    } header: {
                        Text("Newest snowman")
                    }
                    .navigationLinkIndicatorVisibility(.hidden)
                    .listRowSeparator(.hidden)
                } else {
                    Section {
                        VStack(alignment: .leading) {
                            Text("You have no snowmen in your igloo!")
                                .font(.headline)
                            Text("Go to the My Igloo tab to add one.")
                                .font(.subheadline)
                        }
                        .padding(5)
                    }
                    .listRowSeparator(.hidden)
                }
                
                if let snowman = randomSnowman {
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
                    } header: {
                        Text("Random snowman")
                    }
                    .navigationLinkIndicatorVisibility(.hidden)
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
