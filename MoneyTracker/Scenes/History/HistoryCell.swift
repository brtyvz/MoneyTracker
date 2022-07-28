//
//  HistoryCell.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 28.07.2022.
//

import SwiftUI

struct HistoryCell: View {
    var item : Item
    @EnvironmentObject var settings: SettingsViewModel
    var itemFormatter: DateFormatter
    var body: some View {
        HStack{
            VStack(alignment:.leading) {
            if let note = item.note {
                Text("\(note)")
                   
            }
         
            
            Text(item.timestamp!, formatter: itemFormatter)
                .foregroundColor(.gray)
            if let category = item.categoryName {
                Text("\(category)")
                    .foregroundColor(settings.appThemeColor)
            }
        }
            HStack {
                Text(AppUserDefaults.currency)
                Text(String(format: "%.2f", item.value)).fontWeight(.bold)
            }.padding(.leading,65)
            
            
          
        }
    }
}

//struct HistoryCell_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryCell(item: <#Item#>, itemFormatter: <#DateFormatter#>)
//    }
//}
