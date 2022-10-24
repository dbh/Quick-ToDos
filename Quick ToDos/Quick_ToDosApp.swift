//
//  Quick_ToDosApp.swift
//  Quick ToDos
//
//  Created by Dovid Harrison on 10/24/22.
//

import SwiftUI

@main
struct Quick_ToDosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
