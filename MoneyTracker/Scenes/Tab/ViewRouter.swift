//
//  ViewRouter.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 1.07.2022.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .history
}
enum Page {
     case history
     case calender
     case stats
     case settings
 }
