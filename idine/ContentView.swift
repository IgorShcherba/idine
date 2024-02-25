//
//  ContentView.swift
//  idine
//
//  Created by Igor Shcherba on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        MenuView(menu: menu)
    }
}

#Preview {
    ContentView().environmentObject(Order())
}
