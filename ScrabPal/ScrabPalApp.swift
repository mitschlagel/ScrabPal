//
//  ScrabPalApp.swift
//  ScrabPal
//
//  Created by Spencer Jones on 1/31/24.
//

import SwiftUI

@main
struct ScrabPalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
