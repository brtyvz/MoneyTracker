//
//  Color+Extensions.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 22.07.2022.
//

import Foundation
import SwiftUI
import UIKit

extension Color {
    
    func uiColor() -> UIColor {
        if #available(İOS 14.0, *) {
            return UIColor(self)
        }
        let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r:CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xFF000000)>>24) / 255
            g = CGFloat((hexNumber & 0x00FF0000)>>16) / 255
            b = CGFloat((hexNumber & 0x0000FF00)>>8) / 255
            a = CGFloat(hexNumber & 0x000000FF) / 255
        }
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a:CGFloat) {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g:CGFloat = 0.0, b:CGFloat = 0.0,
            a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000)>>24) / 255
            g = CGFloat((hexNumber & 0x00ff0000)>>16) / 255
            b = CGFloat((hexNumber & 0x0000ff00)>>8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r,g,b,a)
    }
    public static var appTheme : Color {
        let appThemeColorHex = AppUserDefaults.appThemeColor
        
        if appThemeColorHex.isEmpty {
            return Color.purple
        }
        return Color(hex: appThemeColorHex)
    }
}

extension Color {
    
    init(hex string: String) {
        var string:String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        let scanner = Scanner(string: string)
        
        var color:UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = Double(g) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray,opacity: 1)
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = Double(g) / 255.0
        
            let alpha = Double(a) / 255.0
            self.init(.sRGB, red: gray, green: gray, blue: gray,opacity: alpha)
        } else if string.count == 6 {
            let mask = 0x0000FF
            
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8)  & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            self.init(.sRGB, red: red, green: green, blue: blue,opacity: 1)
        } else if string.count == 8 {
            let mask = 0x000000FF
            
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16)  & mask
            let b = Int(color>>8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            self.init(.sRGB, red: red, green: green, blue: blue,opacity: alpha)
        }
        else {
            self.init(.sRGB, red: 1, green: 1, blue: 1,opacity: 1)
        }
       
    }
    
}

extension UIColor {
    
    
    public static var appTheme : UIColor {
        return Color.appTheme.uiColor()
    }
    
    func toNewString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format: "#%06x", rgb)
    }
}



