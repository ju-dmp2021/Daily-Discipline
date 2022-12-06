//
//  DailyDisciplineApp.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

@main
struct DailyDisciplineApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
