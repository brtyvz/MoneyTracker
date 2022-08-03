//
//  CustomChartView.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 3.08.2022.
//

import Foundation
import SwiftUI
import Charts

struct CustomChartView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> PieChartView {
        let pieChartView = PieChartView(frame: CGRect.zero)
        return pieChartView
    }
    func updateUIView(_ uiView: PieChartView, context: Context) {
        setDataCount(7, range: 100, chartView: uiView)
    }
    
    func setDataCount(_ count: Int, range: UInt32, chartView:PieChartView) {
        let parties = ["Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
                       "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
                       "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
                       "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
                       "Party Y", "Party Z"]
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                     label: parties[i % parties.count])
        }
        
        let set = PieChartDataSet(entries: entries, label: "Election Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = ChartColorTemplates.vordiplom()
        + ChartColorTemplates.joyful()
        + ChartColorTemplates.colorful()
        + ChartColorTemplates.liberty()
        + ChartColorTemplates.pastel()
        + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.black)
        
        chartView.data = data
        chartView.highlightValues(nil)
    }
}
