//
//  CalenderUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI

struct CalendarUIView: View {
    
    @EnvironmentObject var settings: SettingsViewModel
    @ObservedObject var viewModel = CalendarViewModel()
    @State var actionInput : Int? = 0
    @State var selectedDate = Date()
    @State var item : Item? = nil
    var body: some View {
        NavigationView {
            ZStack {
                
                Color(UIColor.systemGroupedBackground)
                    .edgesIgnoringSafeArea(.all)
                NavigationLink(destination: Text("deneme"), tag: 1, selection: $actionInput){
                    EmptyView()
                }
                CalendarView(appThemeColor: $settings.appThemeColor, item: $item, actionInput: $actionInput, selectedDate: $selectedDate, items: $viewModel.items)
                    .cornerRadius(8).padding()
            }.onAppear(perform:viewModel.onAppear)
            .navigationTitle("calendar")
        }.navigationViewStyle(StackNavigationViewStyle())
            
    }
}

struct CalenderUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarUIView()
    }
}
