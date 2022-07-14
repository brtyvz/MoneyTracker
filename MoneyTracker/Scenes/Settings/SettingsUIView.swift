//
//  SettingsUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI

struct SettingsUIView: View {
    @State private var currencyIndex = AppUserDefaults.currencyIndex
    @State private var currencyList = ["$","₺","€"]
    var body: some View {
        NavigationView {
            Form {
                Picker("selected_currency", selection: $currencyIndex) {
                    ForEach(0 ..< currencyList.count) {
                        Text(self.currencyList[$0]).tag($0)
                               }
                }.onChange(of: currencyIndex, perform: { newValue in
                    AppUserDefaults.currency = self.currencyList[newValue]
                    AppUserDefaults.currencyIndex = newValue
                })
                .pickerStyle(.automatic)
            }.navigationTitle(Text("settings"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsUIView()
    }
}
