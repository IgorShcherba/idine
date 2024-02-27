//
//  CheckoutView.swift
//  idine
//
//  Created by Igor Shcherba on 27/02/2024.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    let paymentMethods: [String] = ["Cash", "Credit Card", "iDine Points"]

    @State private var paymentType = "Cash"

    var body: some View {
        VStack {
            Section {
                Text("Picked method is: \(paymentType)")
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(paymentMethods, id: \.self) { method in
                        Text(method)
                    }
                }
            }
            .pickerStyle(.wheel)
            .padding()
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
