//
//  ContentView.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import SwiftUI

struct MainView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.scrabbleTile)
        }

    var body: some View {
            TabView {
                Group {
                    ScoreView()
                        .environmentObject(ScoreViewModel())
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("Keep Score")
                        }
                    CheckView()
                        .environmentObject(CheckViewModel())
                        .tabItem {
                            Image(systemName: "checkmark")
                            Text("Check Words")
                        }
    //                Text("History")
    //                    .background(Color.backgroundColor)
    //                    .tabItem {
    //                        Image(systemName: "clock.arrow.circlepath")
    //                        Text("History")
    //                    }
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
