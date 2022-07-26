//
//  CalenderView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 18.07.2022.
//

import Foundation
import FSCalendar
import CoreData
import SwiftUI

struct CalendarView : UIViewRepresentable {
    
    @Binding var appThemeColor : Color
    @Binding var item : Item?
    @Binding var actionInput : Int?
    @Binding var selectedDate : Date
    @Binding var items : [Item]
    
    func makeUIView(context: Context) -> FSCalendar {
        let coordinator = context.coordinator
        let calendar = FSCalendar (frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        calendar.dataSource = coordinator
        calendar.backgroundColor = UIColor (named: "TabBarBackground")
        calendar.delegate = coordinator
        return calendar
    }
    
    func  updateUIView (_ uiView: FSCalendar , context: Context) {
        let appColor = appThemeColor.uiColor()
        let appearence = uiView.appearance
        //Font
        appearence.borderRadius = 4.0
        appearence.titleFont = UIFont.boldSystemFont(ofSize: 14)
        appearence.titlePlaceholderColor = UIColor.systemGray
        appearence.subtitlePlaceholderColor = appColor
        appearence.titleDefaultColor = UIColor.label
        appearence.eventSelectionColor = appColor
        appearence.headerTitleFont = UIFont.boldSystemFont(ofSize: 17)
        appearence.weekdayFont = UIFont.boldSystemFont(ofSize: 14)
        appearence.subtitleFont = UIFont.boldSystemFont(ofSize: 10)
        
        //Today Color
        
        appearence.todayColor = appColor.withAlphaComponent(0.25)
        appearence.titleTodayColor = appColor
        
        //Selection Color
        appearence.selectionColor = appColor
        appearence.eventDefaultColor = appColor
        appearence.selectionColor = appColor
        
        appearence.headerTitleColor = appColor
        appearence.subtitleDefaultColor = appColor
        
        appearence.weekdayTextColor = appColor
        uiView.reloadData()
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator (self)
    }
    class Coordinator : NSObject, FSCalendarDataSource, FSCalendarDelegate {
        var control : CalendarView
        
        init(_ control: CalendarView) {
            self.control = control
        }
        //
        func calendar (_ calendar: FSCalendar,numberOfEventsFor date: Date) -> Int {
            let items = control.$items.wrappedValue
            if let foundedItem = items.first { item in
                item.timestamp!.startOfDay ?? Date() == date.startOfDay ?? Date()
            } {
                return 1
            }
            return 0
        }
        //
        func calendar (_ calendar: FSCalendar,subTitleFor date:Date) -> String? {
            let items = control.$items.wrappedValue
           
            let totalValue = items.filter { item in
                item.timestamp!.startOfDay == date.startOfDay
                
            }.map({$0.value}).reduce(0,+)
            
            if totalValue == 0.0 {
                return ""
            }
            else {
                return "\(AppUserDefaults.currency)\(totalValue)"
            }
        }
        //
        func calendar (_ calendar: FSCalendar,didSelect date:Date,at monthPosition: FSCalendarMonthPosition) {
            
            debugPrint("calendar didSelect => \(date)")
            if date < Date() {
                let generator = UIImpactFeedbackGenerator(style: .soft)
                generator.impactOccurred()
            
            
            let items = control.$items.wrappedValue
            if let foundedItem = items.first { item in
                item.timestamp!.startOfDay  == date.startOfDay
            } {
                control.$item.wrappedValue = foundedItem
                control.$actionInput.wrappedValue = 1
            }
            else {
                control.$item.wrappedValue = nil
                control.$selectedDate.wrappedValue = date
                control.$actionInput.wrappedValue = 1
            }
          
        }
     
        }
        
        func calendar (_ calendar:FSCalendar,didDeselect date: Date, at monthPosition:FSCalendarMonthPosition){
        debugPrint("calendar didSelect")
            control.$actionInput.wrappedValue = 0
        }

        
    }
    
}


