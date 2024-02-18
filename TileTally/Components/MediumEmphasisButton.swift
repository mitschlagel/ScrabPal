//
//  MediumEmphasisButton.swift
//  TileTally
//
//  Created by Spencer Jones on 2/18/24.
//

import SwiftUI

struct MediumEmphasisButton: View {
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
                    .fontWeight(.bold)
            }
            .foregroundColor(disabled ? Color.gray : Color.primary400)
            .frame(maxWidth: .infinity)
            .padding()
            .border(disabled ? Color.gray : Color.primary400, width: 2)
            .cornerRadius(2)
            
        }
        .disabled(disabled)
        
    }
    
}

#Preview {
    MediumEmphasisButton(text: "Cancel", action: {})
}
