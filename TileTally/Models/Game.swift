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
    var tilesRemaining: Int = 100
}

struct Player {
    var id: UUID = UUID()
    var role: PlayerRole
    var name: String
    var words: [Word] = []
    var score: Int = 0
}

struct Word: Identifiable {
    var id: UUID = UUID()
    var word: String
    var score: Int = 0
    
    init(_ word: String, _ score: Int) {
        self.word = word
        self.score = score
    }
}

enum PlayerRole {
    case one, two
}
