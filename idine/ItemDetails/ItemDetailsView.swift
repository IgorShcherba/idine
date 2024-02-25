//
//  ItemDetailsView.swift
//  idine
//
//  Created by Igor Shcherba on 25/02/2024.
//

import SwiftUI

struct ItemDetailsView: View {
    var item: MenuItem
    @EnvironmentObject var order: Order

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.caption)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetailsView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetailsView(item: MenuItem.example).environmentObject(Order())
        }
    }
}
