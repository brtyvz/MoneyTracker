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
        ZStack{
    GeometryReader{ reader in
      Text(text)
        Spacer()
        KeyPad(string: $text)
            .padding()
            .frame(width: reader.size.width, height: reader.size.width * 0.4, alignment: .center)
            .padding(.bottom)
    }
    }
    }
}

struct InputUIView_Previews: PreviewProvider {
    static var previews: some View {
        InputUIView()
    }
}
