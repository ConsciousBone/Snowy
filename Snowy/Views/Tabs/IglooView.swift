//
//  IglooView.swift
//  Snowy
//
//  Created by Evan Plant on 25/11/2025.
//

import SwiftUI

struct IglooView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Igloo view")
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        print("showing add sheet")
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    IglooView()
}
