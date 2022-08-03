//
//  HistoryViewModel.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.07.2022.
//

import SwiftUI

class HistoryViewModel : ObservableObject {
    
    @Published var grouped : [ItemSection] = []
    
    func getGroupedItems() {
        PersistenceController.shared.getGroupedItems(){ groupedItems in
            self.grouped = groupedItems.map({ dict in
                ItemSection(name:dict.key ?? "", items: dict.value)
                
            })
        }
    }
    
}

struct ItemSection : Identifiable {
    let id = UUID()
    var name : String
    var items : [Item]
    
    func totalCount() -> Double {
        return items.map ({ item in
            item.value
        }).reduce(0,+)
    }
}

