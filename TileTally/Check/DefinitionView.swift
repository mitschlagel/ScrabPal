//
//  DefinitionView.swift
//  TileTally
//
//  Created by Spencer Jones on 2/18/24.
//

import SwiftUI

struct DefinitionView: View {
    
    var wordToCheck: String
    var error: String?
    var definition: DictionaryResponse?
    
    var body: some View {
        if let errorMessage = error {
           if errorMessage.contains("Decoding") {
               VStack {
                   VStack(spacing: 16) {
                       Text(wordToCheck)
                           .font(.largeTitle)
                           .fontWeight(.bold)
                       Image(systemName: "x.square")
                           .font(Font.system(size: 100))
                           .foregroundStyle(Color.red)
                       Text("NOPE")
                           .font(.largeTitle)
                   }
                   .padding()
               }
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .background(Color.backgroundColor)
               .presentationDragIndicator(.visible)
               
                   
           } else {
               Text(errorMessage)
                   .foregroundColor(.red)
                   .padding()
           }
           
       } else if let definition = definition {
           VStack {
               VStack(spacing: 16) {
                   Text(wordToCheck)
                       .font(.largeTitle)
                       .fontWeight(.bold)
                   Image(systemName: "checkmark.square")
                       .foregroundStyle(Color.green)
                       .font(Font.system(size: 100))
                    showWordDefinitions(meanings: definition.meanings)
               }
               .padding(.top, 32)
               .padding()
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.backgroundColor)
           .presentationDragIndicator(.visible)
       }
    }
    
    @ViewBuilder func showWordDefinitions(meanings: [Meaning]) -> some View {
        VStack(spacing: 8) {
            ForEach(meanings, id: \.id) { meaning in
                VStack(alignment: .leading) {
                    Text(meaning.partOfSpeech)
                        .font(.headline)
                    
                    if let def = meaning.definitions.first?.definition {
                        Text(def)
                        
                    } else {
                        Text("No definition available")
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    DefinitionView(wordToCheck: "foo")
}
