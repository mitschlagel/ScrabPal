//
//  CheckViewModel.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
}

class CheckViewModel: ObservableObject {
        
        @Published private(set) var dictionaryResponse: DictionaryResponse?
        @Published private(set) var isLoading = false
        @Published private(set) var errorMessage: String?

        private var cancellables: Set<AnyCancellable> = []

        private func fetchWordInfo(word: String, completion: @escaping (Result<DictionaryResponse, APIError>) -> Void) {
            guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)") else {
                completion(.failure(.invalidURL))
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(.networkError(error)))
                    return
                }

                guard let data = data else {
                    completion(.failure(.invalidResponse))
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let dictionaryResponse = try decoder.decode([DictionaryResponse].self, from: data)

                    guard let firstResponse = dictionaryResponse.first else {
                        completion(.failure(.invalidResponse))
                        return
                    }

                    completion(.success(firstResponse))
                } catch let decodingError {
                    completion(.failure(.decodingError(decodingError)))
                }
            }.resume()
        }
    
    func getWordInfo(word: String) {
            isLoading = true
            errorMessage = nil

            fetchWordInfo(word: word) { result in
                DispatchQueue.main.async {
                    self.isLoading = false

                    switch result {
                    case .success(let response):
                        self.dictionaryResponse = response
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }
}
