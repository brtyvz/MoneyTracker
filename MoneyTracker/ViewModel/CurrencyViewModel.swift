//
//  CurrencyViewModel.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 17.07.2022.
//

import Foundation
import SwiftyJSON
class CurrencyViewModel:ObservableObject {
    
    @Published var currencyValues : [String] = []
    init () {
        //currency jsona erişim
        let path = Bundle.main.path(forResource: "Common-Currency", ofType: "json")
        do {
            let string = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            let json = JSON.init(parseJSON: string)
            let array = json.rawValue as! [String:Any]
            array.forEach { (key:String, value: Any) in
                let subJson = value as! [String:Any]
                subJson.forEach { (subKey:String, subValue: Any) in
                    if subKey == "symbol" {
                        currencyValues.append(subValue as! String)
                    }
                }
            }
        }
        catch{}
    }
    
    
    
    
}
