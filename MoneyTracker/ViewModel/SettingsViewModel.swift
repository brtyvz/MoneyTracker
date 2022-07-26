//
//  SettingsViewModel.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 24.07.2022.
//

import Foundation
import SwiftUI

class SettingsViewModel : ObservableObject {
    @Published var appThemeColor : Color = Color.appTheme
}
