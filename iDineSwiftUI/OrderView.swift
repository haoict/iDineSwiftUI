//
//  OrderView.swift
//  NextDictSwift
//
//  Created by Nguyen, Hao | Hao | ECMD on 2020/07/08.
//  Copyright © 2020 Hao Nguyen. All rights reserved.
//

import SwiftUI

struct OrderView: View {
  @EnvironmentObject var order: Order
  @State private var showingDeleteConfirmAlert = false
  @State private var deleteOrderOffset: IndexSet?
  
  
  var body: some View {
    NavigationView {
      List {
        Section {
          ForEach(order.items) { item in
            HStack {
              Text(item.name)
              Spacer()
              Text("$\(item.price)")
            }
          }.onDelete(perform: deleteItems)
        }
        Section {
          NavigationLink(destination: CheckoutView()) {
            Text("Place Order")
          }
        }.disabled(order.items.isEmpty)
      }
      .navigationBarTitle("Order")
      .listStyle(GroupedListStyle())
      .navigationBarItems(trailing: EditButton())
      .alert(isPresented:$showingDeleteConfirmAlert) {
        Alert(title: Text("Are you sure you want to delete this?"), message: Text("There is no undo"), primaryButton: .destructive(Text("Delete")) {
          self.order.items.remove(atOffsets: self.deleteOrderOffset!)
          }, secondaryButton: .cancel())
      }
    }
  }
  
  func deleteItems(at offsets: IndexSet) {
    self.deleteOrderOffset = offsets
    self.showingDeleteConfirmAlert = true
  }
}

struct OrderView_Previews: PreviewProvider {
  static let order = Order()
  
  static var previews: some View {
    OrderView().environmentObject(order)
  }
}
