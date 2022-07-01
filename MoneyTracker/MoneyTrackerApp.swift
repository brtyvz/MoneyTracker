//
//  MoneyTrackerApp.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 29.06.2022.
//

import SwiftUI

@main
struct MoneyTrackerApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
          
            TabUIView(viewRouter: viewRouter)
        }
    }
}
