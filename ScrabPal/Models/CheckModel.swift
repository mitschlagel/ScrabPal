//
//  CheckModel.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import Foundation

struct DictionaryResponse: Codable {
    let word: String
    let phonetic: String?
    let phonetics: [Phonetic]?
    let origin: String?
    let meanings: [Meaning]
}

struct Phonetic: Codable {
    let text: String
    let audio: String?
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition: String
    let example: String?
    let synonyms: [String]?
    let antonyms: [String]?
}
