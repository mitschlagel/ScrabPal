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
        NavigationStack {
            if viewModel.game != nil {
                GameView()
                    .navigationTitle("Tile Tally")
                    .navigationBarBackground()
                    .background(Color.backgroundColor)
            } else {
                CreateGameView()
                    .navigationTitle("New Game")
                    .navigationBarBackground()
                    .background(Color.backgroundColor)
            }
                
        }
        
    }
}

#Preview {
    ScoreView().environmentObject(ScoreViewModel())
}
