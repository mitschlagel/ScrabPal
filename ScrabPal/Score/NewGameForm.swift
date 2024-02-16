//
//  NewGameForm.swift
//  ScrabPal
//
//  Created by Spencer Jones on 2/15/24.
//

import SwiftUI

struct NewGameForm: View {
    
    @EnvironmentObject var viewModel: ScoreViewModel
    
    @State private var playerOneName: String = ""
    @State private var playerTwoName: String = ""
    
    
    
    var body: some View {
        NavigationView {
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
            }
            .padding()
            .navigationTitle("New Game")
        }
    }
    
    func startGame() {
        let playerOne = Player(name: playerOneName)
        let playerTwo = Player(name: playerTwoName)
        viewModel.createGame(playerOne: playerOne, playerTwo: playerTwo)
    }
}

#Preview {
    NewGameForm().environmentObject(ScoreViewModel())
}
