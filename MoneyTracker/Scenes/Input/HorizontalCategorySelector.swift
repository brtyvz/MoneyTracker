//
//  HorizontalCategorySelector.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 14.07.2022.
//

import SwiftUI

struct HorizontalCategorySelector: View {
    var categories : [MCategory]
    @Binding var selectedCategory : MCategory?
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(categories) { category in
                    if selectedCategory?.categoryName == category.categoryName {
                        ZStack(alignment:.bottom) {
                            Text(category.categoryName)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.gray)
                                .cornerRadius(12)
                           
                        }.onTapGesture {
                            selectedCategory = nil
                        }
                        
                    }
                    else {
                        Button.init {
                            selectedCategory = category
                        }label: {
                            Text(category.categoryName).padding()
                                .cornerRadius(15)
                        }
                       
                    }
                   
                }
            }
        }
    }
}


