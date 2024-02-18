//
//  CheckView.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import SwiftUI

struct CheckView: View {
    
    @EnvironmentObject var viewModel: CheckViewModel
    
    @State private var wordToCheck: String = ""
    @State private var showInputAlert: Bool = false
    @State private var showDefinitionSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    TextField("word", text: $wordToCheck)
                                .padding()
                                .keyboardType(.alphabet)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.center)
                                .textInputAutocapitalization(.characters)
                                .textCase(.uppercase)
                    HighEmphasisButton(disabled: wordToCheck.isEmpty, text: "Submit", action: {
                        if viewModel.validateWordInput(wordToCheck) {
                            viewModel.getWordInfo(for: wordToCheck)
                        } else {
                            wordToCheck = ""
                            showInputAlert = true
                        }
                        
                    })
                    .alert(isPresented: $showInputAlert) {
                        Alert(
                            title: Text("Not A Word"),
                            message: Text("Definitely not a word, try again."),
                            dismissButton: .default(Text("OK").foregroundColor(Color.primary400))
                        )
                        
                    }
                    if viewModel.isLoading {
                        ProgressView("Checking...")
                            .padding()
                    }
                    if viewModel.errorMessage != nil && !(viewModel.errorMessage?.contains("Decoding") ?? false) {
                        Text(viewModel.errorMessage ?? "Error")
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    Spacer()
                }
                .padding(.top, 32)
                .padding(.horizontal, 16)
            }
            .background(Color.backgroundColor)
            .navigationTitle(Text("Check Words"))
            .navigationBarBackground()
            .sheet(isPresented: $viewModel.showDefinitionSheet) {
                DefinitionView(error: viewModel.errorMessage, definition: viewModel.dictionaryResponse)
            }
        }
        
    }
    
   
}

struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView().environmentObject(CheckViewModel())
    }
}
