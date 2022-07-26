//
//  SettingsUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI

struct SettingsUIView: View {
    @State private var currencyIndex = AppUserDefaults.currencyIndex
   
    @ObservedObject var currencyViewModel = CurrencyViewModel()
    var body: some View {
        NavigationView {
            Form {
                Picker("selected_currency", selection: $currencyIndex) {
                    ForEach(0 ..< currencyViewModel.currencyValues.count) {
                        Text(self.currencyViewModel.currencyValues[$0]).tag($0)
                               }
                }.onChange(of: currencyIndex, perform: { newValue in
                    AppUserDefaults.currency = self.currencyViewModel.currencyValues[newValue]
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
