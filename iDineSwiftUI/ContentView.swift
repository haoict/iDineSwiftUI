//
//  ContentView.swift
//  NextDictSwift
//
//  Created by Nguyen, Hao | Hao | ECMD on 2020/07/06.
//  Copyright © 2020 Hao Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
  
  var body: some View {
    NavigationView {
      List {
        ForEach(menu) { section in
          Section(header: Text(section.name)) {
            ForEach(section.items) { item in
              ItemRow(item: item)
            }
          }
        }
      }
      .navigationBarTitle("Menu")
      .listStyle(GroupedListStyle())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
