//
//  idineApp.swift
//  idine
//
//  Created by Igor Shcherba on 15/02/2024.
//

import SwiftUI

@main
struct idineApp: App {
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
