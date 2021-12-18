//
//  ApiHandler.swift
//  MyStockApp
//
//  Created by RG on 16/12/21.
//

/*
 
 https://api2.binance.com/api/v3/ticker/24hr
 
 [
 {
 "symbol":"ETHBTC",
 "priceChange":"0.00219900",
 "priceChangePercent":"2.749",
 "weightedAvgPrice":"0.08094947",
 "prevClosePrice":"0.07998900",
 "lastPrice":"0.08218500",
 "lastQty":"0.14880000",
 "bidPrice":"0.08218200",
 "bidQty":"3.40090000",
 "askPrice":"0.08218300",
 "askQty":"4.21430000",
 "openPrice":"0.07998600",
 "highPrice":"0.08322500",
 "lowPrice":"0.07830500",
 "volume":"98801.35430000",
 "quoteVolume":"7997.91759581",
 "openTime":1639547204955,
 "closeTime":1639633604955,
 "firstId":315585534,
 "lastId":315817639,
 "count":232106
 },
 ]
 */

import Foundation
class ApiHandler {
    static let shared = ApiHandler()
    
    private init() {}
    
    func getStockPrices(completion: @escaping(([Stock]) -> Void)) {
        
        if let url = URL(string: "https://api2.binance.com/api/v3/ticker/24hr") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion([Stock]())
                    return
                }
                
                if let stocks = try? JSONDecoder().decode([Stock].self, from: data) {
                      completion(stocks)
                } else {
                      completion([Stock]())
                }
        
            }.resume()
            
        }else{
            completion([Stock]()) // return emty stock array
        }
        
    }
    
}
