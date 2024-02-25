//
//  MenuView.swift
//  idine
//
//  Created by Igor Shcherba on 25/02/2024.
//

import SwiftUI

struct MenuView: View {
    var menu: [MenuSection]
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}
