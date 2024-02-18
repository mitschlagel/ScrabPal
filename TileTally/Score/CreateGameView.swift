//
//  NewGameForm.swift
//  ScrabPal
//
//  Created by Spencer Jones on 2/15/24.
//

import SwiftUI

struct CreateGameView: View {
    
    @EnvironmentObject var viewModel: ScoreViewModel
    
    @State private var playerOneName: String = ""
    @State private var playerTwoName: String = ""
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Enter player names to start a new game!")
                    .font(.headline)
                    .foregroundStyle(Color.primaryText)
                TextField("Player One", text: $playerOneName)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                TextField("Player Two", text: $playerTwoName)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                HighEmphasisButton(
                    disabled: playerOneName.isEmpty || playerTwoName.isEmpty,
                    text: "Create Game",
                    action: {
                        startGame()
                    })
                Text("Built by Spencer Jones in 2024")
                    .font(.caption2)
                    .foregroundStyle(Color.primaryText)
                    .padding(.top, 16)
                Spacer()
                
                    
            }
            .padding(.top, 32)
            .multilineTextAlignment(.center)
            .padding()
            
        }
        
    }
    
    func startGame() {
        let playerOne = Player(name: playerOneName)
        let playerTwo = Player(name: playerTwoName)
        viewModel.createGame(playerOne: playerOne, playerTwo: playerTwo)
    }
}

extension View {
    func navigationBarBackground(_ background: Color = Color.primary400) -> some View {
    return self
      .modifier(ColoredNavigationBar(background: background))
  }
}

struct ColoredNavigationBar: ViewModifier {
  var background: Color
  
  func body(content: Content) -> some View {
    content
      .toolbarBackground(
        background,
        for: .navigationBar
      )
      .toolbarColorScheme(.dark, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
  }
}

#Preview {
    CreateGameView().environmentObject(ScoreViewModel())
}
