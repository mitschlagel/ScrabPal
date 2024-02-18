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
                    playerColumn(game.playerOne)
                    playerColumn(game.playerTwo)
                }
                .foregroundStyle(Color.primaryText)
                .padding()
            }
            
            HighEmphasisButton(text: "End Game", action: {viewModel.game = nil})
            
            Spacer()
        }
        .ignoresSafeArea()
        .sheet(item: $showInputView) { item in
            switch item {
            case .playerOne:
                InputView(player: viewModel.game?.playerOne) { player, word, score in
                    handleScore(for: player, word: word, score: score)
                }
            case .playerTwo:
                InputView(player: viewModel.game?.playerTwo) { player, word, score in
                    handleScore(for: player, word: word, score: score)
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder func playerColumn(_ player: Player) -> some View {
        VStack(spacing: 16) {
            Text(player.name)
                .font(.title)
            Text(String(player.score))
                .font(.largeTitle)

            HighEmphasisButton(text: "Play", action: {
                showInputView = player.role == .one ? .playerOne : .playerTwo
            })
            
            List {
                ForEach(player.words) { word in
                    HStack {
                        Text(word.word)
                            .font(Font.custom("Eurostile", size: 16))
                            .kerning(2.0)
                        Spacer()
                        Text(String(word.score))
                    }
                    .listRowBackground(Color.scrabbleTile)
                }
            }
            .font(.footnote)
            .listStyle(.plain)
            
            .cornerRadius(2)
        }
    }
    
    private func handleScore(for player: PlayerRole, word: String, score: Int) {
        if player == .one {
            viewModel.game?.playerOne.words.append(Word(word, score))
            viewModel.game?.playerOne.score += score
        } else {
            viewModel.game?.playerTwo.words.append(Word(word, score))
            viewModel.game?.playerTwo.score += score
        }
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
        vm.createGame(playerOne: Player(role: .one, name: "Alice"), playerTwo: Player(role: .two, name:"Bob"))
        return vm
    }()
    
    static var previews: some View {

        GameView().environmentObject(viewModel)
    }
}
