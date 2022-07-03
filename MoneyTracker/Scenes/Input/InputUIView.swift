//
//  InputUIView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 30.06.2022.
//

import SwiftUI

struct InputUIView: View {
    @State var text = ""
    var body: some View {
        NavigationView {
            VStack{
//        GeometryReader{ reader in
          Text(text)
//            Spacer()
//            KeyPad(string: $text)
//                .padding()
//                .frame(width: reader.size.width, height: reader.size.width * 0.4, alignment: .center)
//                .padding(.bottom)
//        }
                Spacer()
                KeyPad(string: $text)
                    .padding()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.4, alignment: .center)
                    .padding(.bottom)
            }.navigationTitle(Text("add_expense"))
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct InputUIView_Previews: PreviewProvider {
    static var previews: some View {
        InputUIView()
    }
}
