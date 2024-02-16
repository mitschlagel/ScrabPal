//
//  GameView.swift
//  ScrabPal
//
//  Created by Spencer Jones on 2/15/24.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var viewModel: ScoreViewModel
    @State private var playerOneTurn: String = ""
    @State private var playerTwoTurn: String = ""
    @State private var showInputView: InputSheet?
    
    var body: some View {
        VStack {
            if let game = viewModel.game {
                HStack(spacing: 16) {
                    // First Column
                    VStack(spacing: 16) {
                        Text(game.playerOne.name)
                            .font(.headline)
                        Text(String(viewModel.game?.playerOneScore ?? 0))
                            .font(.largeTitle)

                        HighEmphasisButton(text: "Play", action: {
                            showInputView = .playerOne
                        })
                        
                        List {
                            if let words = viewModel.game?.playerOneWords {
                                ForEach(words) { word in
                                    HStack {
                                        Text(word.word)
                                        Spacer()
                                        Text(String(word.score))
                                    }
                                }
                            }
                        }
                        .font(.footnote)
                        .listStyle(.plain)
                        .border(Color.primary400, width: 2)
                    }
                    
                    // Second Column
                    VStack(spacing: 16) {
                        Text(game.playerTwo.name)
                            .font(.headline)
                        Text(String(viewModel.game?.playerTwoScore ?? 0))
                            .font(.largeTitle)
                        HighEmphasisButton(text: "Play", action: {
                            showInputView = .playerTwo
                        })
                        List {
                            if let words = viewModel.game?.playerTwoWords {
                                ForEach(words) { word in
                                    HStack {
                                        Text(word.word)
                                        Spacer()
                                        Text(String(word.score))
                                    }
                                }
                            }
                        }
                        .font(.footnote)
                        .listStyle(.plain)
                        .border(Color.primary400, width: 2)
                        .cornerRadius(2)
                    }
                }
                .foregroundStyle(Color.primaryText)
                .padding()
            }
            
            HighEmphasisButton(text: "End Game", action: {viewModel.game = nil})
            
            Spacer()
        }
        .sheet(item: $showInputView) { item in
            switch item {
            case .playerOne:
                Text("Player One Input")
            case .playerTwo:
                Text("Player Two Input")
            }
        }
        .padding()
    }
}

enum InputSheet: Identifiable {
    case playerOne, playerTwo
    
    var id: Int {
        hashValue
    }
}

struct GameView_Previews: PreviewProvider {
    
    static let viewModel: ScoreViewModel = {
        let vm = ScoreViewModel()
        vm.createGame(playerOne: Player(name: "Alice"), playerTwo: Player(name:"Bob"))
        return vm
    }()
    
    static var previews: some View {

        GameView().environmentObject(viewModel)
    }
}
