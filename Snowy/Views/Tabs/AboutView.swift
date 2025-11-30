//
//  AboutView.swift
//  Snowy
//
//  Created by Evan Plant on 30/11/2025.
//

import SwiftUI

struct AboutView: View {
    let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "Orbit"
    // version stuff, ty searchino!
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading, spacing: 5) {
                    Text(appDisplayName)
                        .font(.title.bold())
                    Text("Version \(appVersion) Build \(buildNumber)")
                        .font(.title3)
                }
            }
            
            Section {
                Text("Developed for Hack Club's Siege Week 13, following a theme of \"Winter\".")
                
                Button {
                    print("opening url")
                    if #available(iOS 26, *) {
                        openURL(URL(string: "https://hackclub.com/")!, prefersInApp: true)
                    } else {
                        openURL(URL(string: "https://hackclub.com/")!)
                    }
                } label: {
                    Label("Learn more about Hack Club", systemImage: "terminal")
                }
                Button {
                    print("opening url")
                    if #available(iOS 26, *) {
                        openURL(URL(string: "https://siege.hackclub.com/")!, prefersInApp: true)
                    } else {
                        openURL(URL(string: "https://siege.hackclub.com/")!)
                    }
                } label: {
                    Label("Learn more about Siege", systemImage: "crown")
                }
            }
            
            Section {
                Text("This app is fully open source! You can see its source code on GitHub.")
                
                Button {
                    print("opening url")
                    if #available(iOS 26, *) {
                        openURL(URL(string: "https://github.com/ConsciousBone/Snowy/")!, prefersInApp: true)
                    } else {
                        openURL(URL(string: "https://github.com/ConsciousBone/Snowy/")!)
                    }
                } label: {
                    Label("Open GitHub repository", systemImage: "terminal")
                }
            }
        }
    }
}

#Preview {
    AboutView()
}
