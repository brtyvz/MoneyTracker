//
//  CategoryProvider.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 14.07.2022.
//

import Foundation
import SwiftUI
import Localize_Swift
struct MCategory : Identifiable {
   var id = UUID()
    var categoryName : String
}
    
    

class CategoryProvider : ObservableObject {
    @Published var categories : [MCategory] = []
    init(){
        for i in 1...14 {
            categories.append(MCategory(categoryName: "category_\(i)".localized()))
        }
    }
}
