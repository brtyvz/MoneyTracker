//
//  StatisticsUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 1.07.2022.
//

import SwiftUI

struct StatisticsUIView: View {
    var body: some View {
        NavigationView {
            Text("statistics")
                .navigationTitle(Text("statistics"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct StatisticsUIView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsUIView()
    }
}
