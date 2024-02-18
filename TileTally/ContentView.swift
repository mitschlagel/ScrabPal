//
//  ContentView.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import SwiftUI

struct ContentView: View {


    var body: some View {
            TabView {
                ScoreView()
                    .environmentObject(ScoreViewModel())
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Score")
                    }
                CheckView()
                    .environmentObject(CheckViewModel())
                    .tabItem {
                        Image(systemName: "checkmark")
                        Text("Check")
                    }
                Text("History")
                    .tabItem {
                        Image(systemName: "clock.arrow.circlepath")
                        Text("History")
                    }
            }
            .tint(Color.primary400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
