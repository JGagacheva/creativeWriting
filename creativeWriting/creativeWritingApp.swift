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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
