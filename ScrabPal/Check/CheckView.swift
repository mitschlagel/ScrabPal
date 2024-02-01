//
//  CheckView.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import SwiftUI

struct CheckView: View {
    @State private var wordToCheck: String = ""
    @ObservedObject var viewModel: CheckViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    TextField("Enter a word", text: $wordToCheck)
                                .padding()
                    HighEmphasisButton(icon: Image(systemName: "questionmark"), text: Text("Check Word"), action: {
                        viewModel.getWordInfo(for: wordToCheck)
                    })
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .padding()
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } else if let dictionary = viewModel.dictionaryResponse {
                        VStack {
                            Text(dictionary.word.uppercased())
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            if let meaning = dictionary.meanings.first {
                                WordDefinition(meaning: meaning)
                            }
                        }
                        .padding(.top, 24)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle(Text("Check"))
        }
        
    }
    
    @ViewBuilder func WordDefinition(meaning: Meaning) -> some View {
        VStack(alignment: .leading) {
            Text(meaning.partOfSpeech)
                .font(.headline)
            ForEach(meaning.definitions, id: \.id) { def in
                VStack {
                    Text(def.definition)
                        .padding(.bottom, 8)
                    Text(def.example ?? "")
                }
            }
        }
    }
}

struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(viewModel: CheckViewModel())
    }
}
