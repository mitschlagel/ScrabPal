//
//  NewGameForm.swift
//  ScrabPal
//
//  Created by Spencer Jones on 2/15/24.
//

import SwiftUI

struct NewGameForm: View {
    
    @EnvironmentObject var viewModel: ScoreViewModel
    
    @State private var player1Name: String = ""
    @State private var player2Name: String = ""
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Player 1")) {
                        TextField("Enter Player 1's Name", text: $player1Name)
                    }
                    
                    Section(header: Text("Player 2")) {
                        TextField("Enter Player 2's Name", text: $player2Name)
                    }
                    
                    
                }
                HighEmphasisButton(
                    disabled: player1Name.isEmpty || player2Name.isEmpty,
                    text: "Create Game",
                    action: {
                        startGame()
                    })
            Spacer()
            }
            .navigationTitle("New Game")
        }
    }
    
    func startGame() {
        let playerOne = Player(name: player1Name)
        let playerTwo = Player(name: player2Name)
        viewModel.createGame(playerOne: playerOne, playerTwo: playerTwo)
    }
}
