//
//  Game.swift
//  ScrabPal
//
//  Created by Spencer Jones on 2/15/24.
//

import Foundation

struct Game {
    var id: UUID = UUID()
    var playerOne: Player
    var playerTwo: Player
    var playerOneWords: [Word] = []
    var playerTwoWords: [Word] = []
    var playerOneScore: Int = 0
    var playerTwoScore: Int = 0
}

struct Player {
    var id: UUID = UUID()
    var name: String
}

struct Word: Identifiable {
    var id: UUID = UUID()
    var word: String
    var score: Int = 0
    
    init(_ word: String) {
        self.word = word
    }
}
