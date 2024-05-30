//
//  itmoHumanLabApp.swift
//  itmoHumanLab
//
//  Created by Alexander Kozharin on 30.05.2024.
//

import SwiftUI

@main
struct itmoHumanLabApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
