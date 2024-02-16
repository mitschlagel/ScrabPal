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
            
            
        } else {
            NewGameForm()
        }
    }
}

#Preview {
    ScoreView().environmentObject(ScoreViewModel())
}
