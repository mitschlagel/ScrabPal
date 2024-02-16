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
                    .navigationTitle("TileTally")
                    .navigationBarBackground()
            } else {
                NewGameView()
                    .navigationTitle("TileTally")
                    .navigationBarBackground()
            }
                
        }
        
    }
}

#Preview {
    ScoreView().environmentObject(ScoreViewModel())
}
