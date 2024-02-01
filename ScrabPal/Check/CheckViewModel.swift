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
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .networkError(let underlyingError):
            return "Network Error: \(underlyingError.localizedDescription)"
        case .invalidResponse:
            return "Invalid API Response"
        case .decodingError(let underlyingError):
            return "Decoding Error: \(underlyingError.localizedDescription)"
        }
    }
}

class CheckViewModel: ObservableObject {
        
        @Published private(set) var dictionaryResponse: DictionaryResponse?
        @Published private(set) var isLoading = false
        @Published private(set) var errorMessage: String?

    private func fetchDictionaryInformation(for word: String, completion: @escaping (Result<[DictionaryResponse], APIError>) -> Void) {
        
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)") else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error)  in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            #if DEBUG
            self.debugPrintJson(data)
            #endif
            do {
                let result = try JSONDecoder().decode([DictionaryResponse].self, from: data)
                completion(.success(result))
            } catch let decodingError {
                completion(.failure(.decodingError(decodingError)))
            }
        }
        task.resume()
        
        
    }
    
    func getWordInfo(for word: String) {
        self.isLoading = true
        fetchDictionaryInformation(for: word) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.dictionaryResponse = response.first
                    self.isLoading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
    func debugPrintJson(_ jsonData: Data) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            let prettyPrintedData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            if let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
                print(prettyPrintedString)
            } else {
                print("Failed to convert data to string.")
            }
        } catch {
            print("Error formatting JSON data: \(error)")
        }
    }
}
