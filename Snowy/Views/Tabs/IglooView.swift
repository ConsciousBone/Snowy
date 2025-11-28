//
//  IglooView.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import SwiftUI

struct IglooView: View {
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Igloo view")
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
                Text("a")
            }
        }
    }
}

#Preview {
    IglooView()
}
