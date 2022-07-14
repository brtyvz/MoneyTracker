//
//  MoneyTrackerApp.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 29.06.2022.
//

import SwiftUI
import IQKeyboardManagerSwift
@main
struct MoneyTrackerApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var viewRouter = ViewRouter()
    init() {
        IQKeyboardManager.shared.enable = true
    }
    var body: some Scene {
        WindowGroup {
            TabUIView(viewRouter: viewRouter)
                .environment(\.managedObjectContext,persistenceController.container.viewContext )
        }
    }
}
