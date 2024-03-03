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

    let tipAmounts: [Int] = [10, 15, 20, 25, 0]

    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }

    @State private var paymentType = "Cash"
    @State private var addLoayaltyDetails = false
    @State private var loayaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(paymentMethods, id: \.self) { method in
                        Text(method)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoayaltyDetails.animation())
                if addLoayaltyDetails {
                    TextField("Enter your iDine ID", text: $loayaltyNumber)
                }
            }

            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }

            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {} message: {
            Text("Your total was \(totalPrice), thank you!")
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
