//
//  HistoryUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 1.07.2022.
//

import SwiftUI

struct HistoryUIView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        HStack{
                            VStack(alignment:.leading) {
                            if let note = item.note {
                                Text("\(note)")
                                   
                            }
                         
                            
                            Text(item.timestamp!, formatter: itemFormatter)
                                .foregroundColor(.gray)
                            if let category = item.categoryName {
                                Text("\(category)")
                                    .foregroundColor(.blue)
                            }
                        }
                            HStack {
                                Text(AppUserDefaults.currency)
                                Text(String(format: "%.2f", item.value)).fontWeight(.bold)
                            }.padding(.leading,65)
                            
                            
                          
                        }
                    }
                }.onDelete(perform: deleteItems)
            }
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
