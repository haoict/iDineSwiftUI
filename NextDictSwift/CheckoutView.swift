//
//  CheckoutView.swift
//  NextDictSwift
//
//  Created by Nguyen, Hao | Hao | ECMD on 2020/07/08.
//  Copyright © 2020 Hao Nguyen. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
  static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
  static let tipAmounts = [10, 15, 20, 25, 0]
  @EnvironmentObject var order: Order
  @State private var paymentType = 0
  @State private var addLoyaltyDetails = false
  @State private var loyaltyNumber = ""
  @State private var tipAmount = 1
  @State private var showingPaymentAlert = false
  
  var totalPrice: Double {
    let total = Double(order.total)
    let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
    return total + tipValue
  }
  
  var body: some View {
    Form {
      Section {
        Picker("How do you want to pay?", selection: $paymentType) {
          ForEach(0 ..< CheckoutView.paymentTypes.count) {
            Text(Self.paymentTypes[$0])
          }
        }
        Toggle(isOn: $addLoyaltyDetails) {
          Text("Add iDine loyalty card")
        }
        if addLoyaltyDetails {
          TextField("Enter your iDine ID", text: $loyaltyNumber)
        }
        Picker("Percentage:", selection: $tipAmount) {
          ForEach(0 ..< Self.tipAmounts.count) {
            Text("\(Self.tipAmounts[$0])%")
          }
        }.pickerStyle(SegmentedPickerStyle())
        Section(header:
          Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
            .font(.largeTitle)
        ) {
          Button("Confirm order") {
            self.showingPaymentAlert.toggle()
          }
        }
      }
    }
    .alert(isPresented: $showingPaymentAlert) {
      Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"), dismissButton: .default(Text("OK")))
    }
    .navigationBarTitle(Text("Payment"), displayMode: .inline)
    
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static let order = Order()
  
  static var previews: some View {
    CheckoutView().environmentObject(order)
  }
}
