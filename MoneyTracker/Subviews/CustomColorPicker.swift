//
//  CustomColorPicker.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 26.07.2022.
//

import Foundation
import SwiftUI

struct CustomColorPicker : View {
   
    @State var colors : [UIColor]
    
    var completion : (Color) -> ()
    
    var body : some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack (alignment: .center, spacing: 14) {
                
                ForEach(0..<colors.count) { index in
                    ZStack(alignment: .center){
                        Button(action: {
                            self.completion(Color(self.colors[index]))
                        }) {
                            Circle()
                                .fill(Color(self.colors[index]))
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                    }.frame(width: 24, height: 24, alignment: .center)
                }
                
            }.padding(8)
            
        }
        
    }
    
    
    
}
