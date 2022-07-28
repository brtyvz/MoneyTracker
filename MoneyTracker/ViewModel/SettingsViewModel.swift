//
//  SettingsViewModel.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 24.07.2022.
//

import Foundation
import SwiftUI


class SettingsViewModel : ObservableObject {
    
    @Published var theme : ColorScheme? = nil
    @Published var appThemeColor : Color = Color.appTheme
//    @Published var alertMessage  : AlertMessage = AlertMessage(isShowing:false,message:"")
    init(){
        theme = getTheme()
    }
    
    func changeApptheme(theme:  Int){
        AppUserDefaults.preferredTheme = theme
        self.theme = getTheme()
    }
    
    func changeAppColor(color : Color,shouldShowAlert: Bool = true) {
        let hex = color.uiColor().toHexString
        if  hex().count == 7 {
            AppUserDefaults.appThemeColor = hex()
        }
        appThemeColor = Color.appTheme
        if shouldShowAlert {
//            showAlert(message: "changed_app_theme")
        }
    }
    func getTheme() -> ColorScheme? {
        let theme = AppUserDefaults.preferredTheme
        var _theme : ColorScheme? = nil
        if theme == 0 {
            _theme = nil
        } else if theme == 1 {
            _theme = ColorScheme.light
        } else  {
            _theme = ColorScheme.dark
        }
        return _theme
    }
    
//    func showAlert (message : String) {
//        self.alertMessage = AlertMessage.init(isShowing: true, message: message.localized)
//    }

}
