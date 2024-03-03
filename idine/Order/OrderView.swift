//
//  OrderView.swift
//  idine
//
//  Created by Igor Shcherba on 25/02/2024.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }

                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
            }
        }
        .navigationTitle("Order")
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
