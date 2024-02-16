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

struct Word {
    
}
