//
//  ContentView.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import SwiftUI

struct MainView: View {

    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab ) {
            ScoreView()
                .tag(0)
                .environmentObject(ScoreViewModel())
                .tabItem {
                    Label("Keep Score", systemImage: (selectedTab == 0 ? "list.bullet.circle.fill" : "list.bullet.circle"))
                }
                
                
            CheckView()
                .tag(1)
                .environmentObject(CheckViewModel())
                .tabItem {
                    Label("Check Words", systemImage: (selectedTab == 1 ? "checkmark.circle.fill" : "checkmark.circle"))
                }
                
                
        }
            .tint(Color.primary400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
