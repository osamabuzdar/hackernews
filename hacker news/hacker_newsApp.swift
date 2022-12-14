//
//  hacker_newsApp.swift
//  hacker news
//
//  Created by Osama Buzdar on 09/09/2022.
//

import SwiftUI

@main
struct hacker_newsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NewsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
