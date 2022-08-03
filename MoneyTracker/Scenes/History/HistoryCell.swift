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
    var color : Color
    var body: some View {
        HStack{
            VStack(alignment:.leading) {
                if let note = item.note {
                    if !note.isEmpty {
                        Text("\(note)")
                            .foregroundColor(Color(.label))
                    }
                }
                if let category = item.categoryName {
                    Text("\(category)")
                        .foregroundColor(settings.appThemeColor)
                }
            }
            Spacer()
            VStack(alignment: .trailing){
            HStack {
                Text(AppUserDefaults.currency)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Text(String(format: "%.2f", item.value))
                    .fontWeight(.bold)
            }
        }
        }
        .background(Color(UIColor.systemBackground))
    }
}

//struct HistoryCell_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryCell(item: <#Item#>, itemFormatter: <#DateFormatter#>)
//    }
//}
