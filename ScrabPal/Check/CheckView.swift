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
                VStack {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    TextField("Enter a word", text: $wordToCheck)
                                .padding()
                    HighEmphasisButton(icon: Image(systemName: "questionmark"), text: Text("Check Word"), action: {
                        viewModel.getWordInfo(word: wordToCheck)
                    })
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .padding()
                    } else if let dictionaryResponse = viewModel.dictionaryResponse {
                        ForEach(dictionaryResponse.meanings, id: \.partOfSpeech) { meaning in
                            VStack(alignment: .leading) {
                                Text("Part of Speech: \(meaning.partOfSpeech)")
                                    .font(.headline)

                                ForEach(meaning.definitions, id: \.definition) { definition in
                                    Text("Definition: \(definition.definition)")
                                        .padding(.leading)
                                    if let example = definition.example {
                                        Text("Example: \(example)")
                                            .padding(.leading)
                                    }
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.vertical, 5)
                                        }
                    }
                    Spacer()
                }
                .ignoresSafeArea()
            }
            .navigationTitle(Text("Check"))
        }
        
    }
}

struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(viewModel: CheckViewModel())
    }
}
