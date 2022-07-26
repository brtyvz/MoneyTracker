//
//  Date+Extensions.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 22.07.2022.
//

import Foundation

extension Date {
    func toDayFormat()->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    func toMonthFormat()->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        let dateString = formatter.string(from: self)
        return dateString
    }
    func toReadableFormat()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let dateString = formatter.string(from: self)
        return dateString
    }
    func toReadableFormatWithoutYear()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        let dateString = formatter.string(from: self)
        return dateString
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    public func setTime(hour:Int,min:Int,sec: Int,timeZoneAbbrev:String = "UTC") -> Date {
        let x: Set<Calendar.Component> = [.year,.month,.day,.hour,.minute,.second]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: self)
        components.timeZone = TimeZone(abbreviation: timeZoneAbbrev)
        components.hour = hour
        components.minute = min
        components.second = sec
        
        return cal.date(from: components) ?? self
    }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    var startOfDay:Date {
        return Calendar.current.startOfDay(for: self)
    }
    var  endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
}
