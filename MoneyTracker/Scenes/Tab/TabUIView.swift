//
//  TabUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI
import Localize_Swift
struct TabUIView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    @State var showPopUp = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .history:
                    HistoryUIView()
                case .calender:
                    CalendarUIView()
                case .stats:
                  StatisticsUIView()
                case .settings:
                    SettingsUIView()
                }
                Spacer()
                ZStack {
                    if showPopUp {
                        PlusMenu(widthAndHeight: geometry.size.width/7)
                            .offset(y: -geometry.size.height/6)
                    }
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .history, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "clock", tabName: "history".localized())
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .calender, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "calendar", tabName: "calendar".localized())
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                .foregroundColor(Color("DarkPurple"))
                                .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                        }
                            .offset(y: -geometry.size.height/8/2)
                            .onTapGesture {
                                withAnimation {
                                    showPopUp.toggle()
                                }
                            }
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .stats, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "chart.bar.fill", tabName: "statistics".localized())
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .settings, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "gear", tabName: "settings".localized())
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBarBackground").shadow(radius: 2))
                }
            }
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewRouter: ViewRouter())
//            .preferredColorScheme(.light)
//    }
//}

struct PlusMenu: View {
    
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "record.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
        }
            .transition(.scale)
    }
}
