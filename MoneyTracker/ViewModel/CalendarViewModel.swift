//
//  CalendarViewModel.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 24.07.2022.
//

import Foundation
import CoreData
class CalendarViewModel:ObservableObject {
    @Published var items : [Item] = []
    
    func onAppear() {
        getItems()
    }
    func getItems(){
        PersistenceController.shared.getItems { items in
            self.items = items
        }
    }
}
