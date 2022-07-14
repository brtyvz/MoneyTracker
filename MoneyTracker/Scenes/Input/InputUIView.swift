//
//  InputUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI

struct InputUIView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentaitonMode
    @State var text = "0"
    @State var note = ""
    @State var selectedCategory : MCategory? = nil
    @State var currency = AppUserDefaults.currency
    
    @ObservedObject var categoryProvider = CategoryProvider()
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all)
            GeometryReader { reader in
            VStack{
                
                HStack {
                    Text(currency)
                        .font(.title)
                        .foregroundColor(.gray)
                    Text(text)
                        .font(.some(Font.system(size: 50, weight: .semibold, design: .rounded)))
                }
                .padding(.top)
                //note text field
                TextField("input_note", text: $note)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.leading,2)
                    
                // category selector
                HorizontalCategorySelector(categories: categoryProvider.categories, selectedCategory:$selectedCategory)
                    .padding(.horizontal,3)
                Spacer()
                //keypad
                KeyPad(string: $text)
                    .padding()
                    .frame(width: reader.size.width, height: reader.size.height*0.4, alignment: .center)
                    .padding(.bottom,8)
                Button {
                    if let value = Double(text) {
                        addItem(value: value)
                    }
                    presentaitonMode.wrappedValue.dismiss()
                } label: {
                    SaveButton(color: text == "0" ? Color.gray : Color.purple )
                        .padding(.horizontal)
                        .padding(.vertical,8)
                }.disabled(text == "0")
                
            }
            }
            .ignoresSafeArea(.keyboard,edges: .bottom)
            .navigationTitle(Text("add_expense"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    presentaitonMode.wrappedValue.dismiss()
                }, label: {
                    Image.init(systemName: "xmark.circle")
                        .foregroundColor(.gray)
                }))
        }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
        
    private func addItem(value : Double) {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.value = value
            newItem.timestamp = Date()
            newItem.note = note
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct InputUIView_Previews: PreviewProvider {
    static var previews: some View {
        InputUIView()
    }
}
