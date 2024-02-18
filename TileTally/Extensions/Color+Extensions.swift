//
//  Color+Extensions.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import Foundation
import SwiftUI

extension Color {
    static let buttonText = Color.white
    static let primary400 = Color("primaryColor")
    static let primary200 = Color("primaryVariant")
    static let primaryText = Color("primaryText")
    static let secondary400 = Color("secondaryColor")
    static let secondary200 = Color("secondaryText")
    static let tertiary400 = Color("tertiaryColor")
    static let backgroundColor = Color("backgroundColor")
    static let scrabbleTile = Color("scrabbleTile")
    
    static var woodGrain: LinearGradient {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(hex: "F5E1C9"), location: 0),
                .init(color: Color(hex: "F9E9D2"), location: 0.3),
                .init(color: Color(hex: "D8B684"), location: 0.7),
                .init(color: Color(hex: "F5E1C9"), location: 1)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

