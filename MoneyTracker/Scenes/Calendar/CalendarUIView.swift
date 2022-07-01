//
//  CalenderUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI

struct CalendarUIView: View {
    var body: some View {
        NavigationView {
            Text("calendar")
                .navigationTitle(Text("calendar"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CalenderUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarUIView()
    }
}
