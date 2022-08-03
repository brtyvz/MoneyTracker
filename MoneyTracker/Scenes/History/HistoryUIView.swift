//
//  HistoryUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 1.07.2022.
//

import SwiftUI

struct HistoryUIView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var settings: SettingsViewModel
    @ObservedObject var viewModel = HistoryViewModel()
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all)
                //                ScrollView {
                //                    LazyVStack(spacing: 0) {
                List{
                    ForEach(viewModel.grouped) { section in
                        Section(header:  HistoryHeaderView(headerName:section.name),footer: HistoryFooterCell(totalCount: section.totalCount())
                                
                        )
                        {
                            ForEach(section.items) { item in
                                Button {
                                    //                                        self.item = item
                                    //                                        self.actionAddDiary = 1
                                } label: {
                                    HistoryCell (
                                        item: item,
                                        itemFormatter: itemFormatter,
                                        color: settings.appThemeColor
                                    )
                                }
                                
                            }
                        }.modifier(SectionHeaderStyle())
                    }
                }
                //                    }
                //                }
            }
            .onAppear(perform: {self.viewModel.getGroupedItems()})
            
            .navigationTitle(Text("history"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct HistoryUIView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryUIView()
    }
}








//ForEach(items) { item in
//    NavigationLink {
//       HistoryDetailView(item: item)
//    } label: {
//        HistoryCell(item: item, settings: _settings, itemFormatter: itemFormatter)
//    }
//}.onDelete(perform: deleteItems)
