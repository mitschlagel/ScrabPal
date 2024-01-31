//
//  HighEmphasisButton.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//
import AssetsLibrary
import SwiftUI

struct HighEmphasisButton: View {
    // Properties
    var icon: Image?
    var text: Text
    var action: () -> Void

    // Body
    var body: some View {
        Button(action: {
            // Perform action when the button is tapped
            self.action()
        }) {
            HStack {
                icon
                text
            }
            .foregroundColor(Color.buttonText)
            .padding()
            .background(Color.primary)
            .cornerRadius(10)
            .padding(.vertical, 12)
        }
    }
}

struct HighEmphasisButton_Previews: PreviewProvider {
    static var previews: some View {
        HighEmphasisButton(text: Text("Hello"), action: {print("Hello")})
    }
}
