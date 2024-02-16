//
//  ScoreView.swift
//  ScrabPal
//
//  Created by Spencer Jones on 2/15/24.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject var viewModel: ScoreViewModel
    
    var body: some View {
        if let game = viewModel.game {
            VStack {
                Text("Player 1: \(game.playerOne.name), Player 2: \(game.playerTwo.name)")
                Button("End Game", action: {viewModel.game = nil})
                
                Spacer()
            }
            
        } else {
            NewGameForm()

//            Button(action: {
//                viewModel.createGame(playerOne: Player(name: "Bob"), playerTwo: Player(name: "Alice"))
//            }, label: {
//                Text("Create Game")
//            })
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
