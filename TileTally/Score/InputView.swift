//
//  InputView.swift
//  TileTally
//
//  Created by Spencer Jones on 2/17/24.
//

import SwiftUI

struct InputView: View {
    @State private var wordInput: String = ""
    @State private var scoreInput: String = ""
    @State private var score: Int?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Enter your word and score:")
                .font(.headline)
                .foregroundStyle(Color.primaryText)
            TextField("word", text: $wordInput)
                .padding()
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            TextField("score", text: $scoreInput)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .frame(width: 100)
                .multilineTextAlignment(.center)
                .padding()
            HighEmphasisButton(
                disabled: wordInput.isEmpty || scoreInput.isEmpty,
                text: "Submit",
                action: {
                    // Attempt to convert the user input to an integer
                    if let scoreValue = Int(scoreInput) {
                        // Successfully converted to an integer
                        self.score = scoreValue
                    } else {
                        // Handle invalid input (non-integer)
                        // You may show an alert or provide feedback to the user
                        print("Invalid input. Please enter a valid integer.")
                    }
                })
            HighEmphasisButton(text: "Cancel", action: {dismiss()})
            Spacer()
        }
        .padding()
    }
}

#Preview {
    InputView()
}
