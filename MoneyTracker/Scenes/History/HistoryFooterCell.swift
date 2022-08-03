//
//  HistoryFooterCell.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 3.08.2022.
//

import SwiftUI

struct HistoryFooterCell: View {
    var totalCount : Double
    var body: some View {
        HStack {
            Spacer()
            
            Text(AppUserDefaults.currency)
            Text(String(format: "%.2f", totalCount))
                .font(.body)
            
        }
    }
}

struct HistoryFooterCell_Previews: PreviewProvider {
    static var previews: some View {
        HistoryFooterCell(totalCount: 100.00)
    }
}
