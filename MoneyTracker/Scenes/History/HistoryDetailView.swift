//
//  HistoryDetailView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 29.07.2022.
//

import SwiftUI

struct HistoryDetailView: View {
    var item : Item
    var body: some View {
        Text("\(item.value ?? 00)")
    }
}

