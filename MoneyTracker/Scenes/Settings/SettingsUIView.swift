//
//  SettingsUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI

struct SettingsUIView: View {
    var body: some View {
        NavigationView {
            Text("settings")
                .navigationTitle(Text("settings"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsUIView()
    }
}
