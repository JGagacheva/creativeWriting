//
//  creativeWritingApp.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//

import SwiftUI

@main
struct creativeWritingApp: App {
    let persistenceController = PersistenceController.shared
    init() {
        Note.deleteAll(persistenceController.container.viewContext)
        Note.createNotes(persistenceController.container.viewContext)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
