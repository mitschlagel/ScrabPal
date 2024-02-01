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
                    } else if let dictionaryResponse = viewModel.dictionaryResponse {
                        VStack {
                            Text(dictionaryResponse.word.uppercased())
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text(dictionaryResponse.meanings.first?.definitions.first?.definition ?? "error")
                        }
                        .padding(.top, 24)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
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
