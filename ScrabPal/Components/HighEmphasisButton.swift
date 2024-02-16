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
    var disabled: Bool = false
    var text: String
    var action: () -> Void

    // Body
    var body: some View {
        Button(action: {
            // Perform action when the button is tapped
            action()
        }) {
            HStack {
                icon
                Text(text)            }
            .foregroundColor(Color.buttonText)
            .padding()
            .background(disabled ? Color.gray : Color.primary)
            .cornerRadius(10)
            
        }
        .disabled(disabled)
        .frame(maxWidth: .infinity)
        
    }
    
}

struct HighEmphasisButton_Previews: PreviewProvider {
    static var previews: some View {
        HighEmphasisButton(text: "Hello", action: {print("Hello")})
    }
}
