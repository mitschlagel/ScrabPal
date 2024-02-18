//
//  InputView.swift
//  TileTally
//
//  Created by Spencer Jones on 2/17/24.
//

import Combine
import SwiftUI

struct InputView: View {
    
    var player: Player?
    var onSubmit: (String, Int) -> Void
    
    @State private var wordInput: String = ""
    @State private var scoreInput: String = ""
    @State private var score: Int?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Text(player?.name ?? "")
                    .font(.headline)
                    .foregroundStyle(Color.primaryText)                   
                VStack {
                    TextField("WORD", text: $wordInput)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.allCharacters)
                        .textCase(.uppercase)
                        .frame(width: 200)
                    TextField("SCORE", text: $scoreInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 200)
                        .onReceive(Just(scoreInput)) { newInput in
                            let filtered = newInput.filter { "0123456789".contains($0) }
                            if filtered != newInput {
                                self.scoreInput = filtered
                            }
                        }
                }
                .multilineTextAlignment(.center)
                .padding(.vertical, 24)
                
                HighEmphasisButton(
                    disabled: wordInput.isEmpty || scoreInput.isEmpty,
                    text: "Submit",
                    action: {
                        if let scoreValue = Int(scoreInput), validateWordInput(wordInput) {
                            self.score = scoreValue
                            onSubmit(wordInput, scoreValue)
                            dismiss()
                        } else {
                            print("invalid")
                        }
                    })
                HighEmphasisButton(text: "Cancel", action: {dismiss()})
                Spacer()
            }
            
            .padding()
            
        }
        .background(Color.backgroundColor)
        
    }
    
    private func validateWordInput(_ input: String) -> Bool {
        let letterRegex = "^[a-zA-Z]+$"
        let letterTest = NSPredicate(format:"SELF MATCHES %@", letterRegex)
        return letterTest.evaluate(with: input)
    }
}

#Preview {
    InputView(player: Player(role: .one, name: "Bob"), onSubmit: { word, score in
            print(word, score)
    })
}
