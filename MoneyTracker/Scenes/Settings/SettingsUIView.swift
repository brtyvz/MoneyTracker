//
//  SettingsUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI

struct SettingsUIView: View {
    @State private var currencyIndex = AppUserDefaults.currencyIndex
    @EnvironmentObject var settings: SettingsViewModel
    @StateObject var settingsViewModel = SettingsViewModel()
    @ObservedObject var currencyViewModel = CurrencyViewModel()
    @State private var themeType = AppUserDefaults.preferredTheme
    
    let colors : [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemGray,
        .systemCyan,
        .systemGreen,
        .systemBrown,
        .systemIndigo,
        .systemOrange,
        .systemPurple,
        .systemPink
    ]
    
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
                
                Section(header: Text("preferences")) {
                    HStack {
                        Text("app_theme")
                        Spacer()
                        CustomColorPicker(colors: colors) { color in
                            
                            settings.changeAppColor(color: color)
                            
                        }
                    }
                    HStack {
                        Text("appearance")
                        Spacer()
                        Picker("",selection: $themeType.onChange(themeChange)) {
                            Text("default_appearance").tag(0)
                            Text("light_appearance").tag(1)
                            Text("dark_appearance").tag(2)
                        }.fixedSize()
                    }
                }.modifier(SectionHeaderStyle())
                
            }.navigationTitle(Text("settings"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    func themeChange (_ tag: Int) {
        settings.changeApptheme(theme: tag)
    }
}

struct SettingsUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsUIView()
    }
}

struct SectionHeaderStyle: ViewModifier {
    func body(content:Content) -> some View {
        Group {
            if #available(iOS 14, *) {
                AnyView(content.textCase(.none))
                
            } else {
                content
            }
        }
    }
}

extension Binding {
    func didSet(execute:@escaping (Value)->Void) -> Binding {
        return Binding(
            get: {self.wrappedValue },
            set:{
                self.wrappedValue = $0
                execute($0)
            }
        )
    }
    
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding <Value> {
        return Binding(
            get: {self.wrappedValue },
            set:{ selection in
                self.wrappedValue = selection
                handler(selection)
            })
    }
    
}

