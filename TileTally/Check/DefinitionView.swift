//
//  DefinitionView.swift
//  TileTally
//
//  Created by Spencer Jones on 2/18/24.
//

import SwiftUI

struct DefinitionView: View {
    
    var error: String?
    var definition: DictionaryResponse?
    
    var body: some View {
        if let errorMessage = error {
           if errorMessage.contains("Decoding") {
               VStack {
                   VStack(spacing: 16) {
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
                   Image(systemName: "checkmark.square")
                       .foregroundStyle(Color.green)
                       .font(Font.system(size: 100))
                   Text(definition.word.uppercased())
                       .font(.largeTitle)
                       .fontWeight(.bold)
                   if let meaning = definition.meanings.first {
                       showWordDefinition(meaning: meaning)
                   }
               }
               .padding(.top, 32)
               .padding()
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.backgroundColor)
           .presentationDragIndicator(.visible)
       }
    }
    
    @ViewBuilder func showWordDefinition(meaning: Meaning) -> some View {
        VStack(spacing: 8) {
            Text(meaning.partOfSpeech)
                .font(.headline)
            ForEach(meaning.definitions, id: \.id) { def in
                VStack(spacing: 8) {
                    Text(def.definition)
                    Text(def.example ?? "")
                }
                
            }
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    DefinitionView()
}
