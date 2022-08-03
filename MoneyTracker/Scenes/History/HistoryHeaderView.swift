//
//  MonthHeaderView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 2.08.2022.
//

import SwiftUI

struct HistoryHeaderView: View {
    var headerName: String
   
    var body: some View {
        
        HStack {
            Spacer()
            Text(headerName)
                .fontWeight(.semibold)
                .font(.subheadline)
                .foregroundColor(Color(.label))
            Spacer()
            
        }
     
    }
}

//struct MonthHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        MonthHeaderView()
//    }
//}
