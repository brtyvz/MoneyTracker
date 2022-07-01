//
//  HistoryUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 1.07.2022.
//

import SwiftUI

struct HistoryUIView: View {
    var body: some View {
        NavigationView {
            Text("history")
                .navigationTitle(Text("history"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HistoryUIView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryUIView()
    }
}
