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
            VStack {
                GeometryReader { reader in
                    Form {
                        CustomChartView()
                            .frame(height: reader.size.height*0.4, alignment: .center)
                    }
                }
            }
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
