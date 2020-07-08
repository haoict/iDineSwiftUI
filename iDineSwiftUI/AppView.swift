//
//  AppView.swift
//  NextDictSwift
//
//  Created by Nguyen, Hao | Hao | ECMD on 2020/07/08.
//  Copyright © 2020 Hao Nguyen. All rights reserved.
//

import SwiftUI

struct AppView: View {
  @State private var selection = 0
  
  var body: some View {
    TabView(selection: $selection) {
      ContentView()
        .tabItem {
          Image(systemName: "list.dash")
          Text("Menu")
      }
      .tag(0)
      OrderView()
        .tabItem {
          Image(systemName: "square.and.pencil")
          Text("Order")
      }
      .tag(1)
    }
  }
}

struct AppView_Previews: PreviewProvider {
  static let order = Order()
  
  static var previews: some View {
    AppView().environmentObject(order)
  }
}
