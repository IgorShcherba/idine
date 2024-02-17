//
//  ItemRow.swift
//  idine
//
//  Created by Igor Shcherba on 17/02/2024.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    let colors: [String: Color] = ["V": .green, "D": .purple, "N": .red, "G": .black, "S": .blue]
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(.gray, lineWidth: 2))

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }

            ForEach(item.restrictions, id: \.self) { restriction in
                let color = colors[restriction, default: .black]
                RestrictionBadge(restriction: restriction, bgColor: color)
            }
        }
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}
