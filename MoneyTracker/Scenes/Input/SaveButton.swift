//
//  SaveButton.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 12.07.2022.
//

import SwiftUI

struct SaveButton: View {
    var color : Color
    var body: some View {
        HStack {
            Spacer()
            Text("save")
                .fontWeight(.black)
                .font(.title)
                .foregroundColor(.white)
                .padding(8)
            Spacer()
        }.background(color)
            .cornerRadius(20)
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(color: Color.blue)
    }
}
