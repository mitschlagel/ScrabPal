//
//  GameView.swift
//  ScrabPal
//
//  Created by Spencer Jones on 2/15/24.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var viewModel: ScoreViewModel
    
    var body: some View {
        VStack {
            if let game = viewModel.game {
                HStack(spacing: 20) {
                    // First Column
                    VStack(spacing: 8) {
                        Text(game.playerOne.name)
                            .font(.headline)
                        Text("58")
                            .font(.largeTitle)
                        List {
                            HStack {
                                Text("HELLO")
                                Spacer()
                                Text("16")
                            }
                            HStack {
                                Text("CHECK")
                                Spacer()
                                Text("23")
                            }
                            HStack {
                                Text("WINNER")
                                Spacer()
                                Text("8")
                            }
                        }
                        .font(.footnote)
                        .listStyle(.plain)
                        .border(Color.primary400, width: 2)
                    }
                    
                    // Second Column
                    VStack(spacing: 8) {
                        Text(game.playerTwo.name)
                            .font(.headline)
                        Text("62")
                            .font(.largeTitle)
                        List {
                            HStack {
                                Text("HELLO")
                                Spacer()
                                Text("16")
                            }
                            HStack {
                                Text("CHECK")
                                Spacer()
                                Text("23")
                            }
                            HStack {
                                Text("WINNER")
                                Spacer()
                                Text("8")
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
        .padding()
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
