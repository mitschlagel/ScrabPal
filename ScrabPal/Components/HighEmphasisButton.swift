//
//  HighEmphasisButton.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

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
                Text(text)
            }
            .foregroundColor(Color.buttonText)
            .frame(maxWidth: .infinity)
            .padding()
            .background(disabled ? SwiftUI.Color.gray : SwiftUI.Color.primary400)
            .cornerRadius(2)
            
        }
        .disabled(disabled)
        
    }
    
}

#Preview {
    HighEmphasisButton(icon: nil, disabled: false, text: "Hello", action: {})
}
