//
//  ContentView.swift
//  NextDictSwift
//
//  Created by Nguyen, Hao | Hao | ECMD on 2020/07/06.
//  Copyright © 2020 Hao Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var selection = 0
  
  let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
  
  var body: some View {
    TabView(selection: $selection){
      NavigationView {
        List {
          ForEach(menu) { section in
            Text(section.name)
            ForEach(section.items) { item in
              Text(item.name)
            }
          }
        }
        .navigationBarTitle("Menu")
        .listStyle(GroupedListStyle())
      }
      .tabItem {
        VStack {
          Image("first")
          Text("First")
        }
      }
      .tag(0)
      Text("Second View")
        .font(.title)
        .tabItem {
          VStack {
            Image("second")
            Text("Second")
          }
      }
      .tag(1)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
