//
//  ItemDetail.swift
//  NextDictSwift
//
//  Created by Nguyen, Hao | Hao | ECMD on 2020/07/08.
//  Copyright © 2020 Hao Nguyen. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
  var item: MenuItem
  @EnvironmentObject var order: Order
  @State private var showOrderConfirmAlert = false
  
  var body: some View {
    VStack {
      ZStack(alignment: .bottomTrailing) {
        Image(item.mainImage)
        Text("Photo: \(item.photoCredit)")
          .padding(4)
          .background(Color.black)
          .font(.caption)
          .foregroundColor(.white)
          .offset(x: -5, y: -5)
      }
      Text(item.description)
        .padding()
      Button("Order This") {
        self.order.add(item: self.item)
        self.showOrderConfirmAlert.toggle()
      }.font(.headline)
      .alert(isPresented: $showOrderConfirmAlert) {
        Alert(title: Text("Order confirmed"), message: Text("Order placed!"), dismissButton: .default(Text("OK")))
      }
      Spacer()
    }
    .navigationBarTitle(Text(item.name), displayMode: .inline)
  }
}

struct ItemDetail_Previews: PreviewProvider {
  static let order = Order()
  
  static var previews: some View {
    NavigationView {
      ItemDetail(item: MenuItem.example)
    }
  }
}
