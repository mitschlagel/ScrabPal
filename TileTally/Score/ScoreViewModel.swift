//
//  ScoreViewModel.swift
//  ScrabPal
//
//  Created by Spencer Jones on 2/15/24.
//

import Foundation

class ScoreViewModel: ObservableObject {
    
    @Published var game: Game?
    
    func createGame(playerOne: Player, playerTwo: Player) {
        self.game = Game(playerOne: playerOne, playerTwo: playerTwo)
    }
}
