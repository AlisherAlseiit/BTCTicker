//
//  ContentModel.swift
//  CoinTicker
//
//  Created by Алишер Алсейт on 05.11.2021.
//

import SwiftUI

class ContentModel: ObservableObject {
    
    @Published var rates = [Rate]()
    @Published var selection = "USD"
    
    init() {
        fetchSpecificRate(first: "BTC", second: "USD")
        fetchSpecificRate(first: "ETH", second: "USD")
        fetchSpecificRate(first: "LTC", second: "USD")
    }
    
    func fetchSpecificRate(first: String, second: String) {
      
        guard let url  = URL(string: "https://rest.coinapi.io/v1/exchangerate/\(first)/\(selection)?apikey=\(Constants.apiKey)") else {
            
            return
        }
        
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("\(Constants.apiKey)", forHTTPHeaderField: "X-CoinAPI-Key")
        
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                
               let rate = try decoder.decode(Rate.self, from: data!)
                
                DispatchQueue.main.async {
                    
                    self.rates.append(rate)
                    
                    
                }
                
            }
            catch {
                print("error")
            }
            
            
            
        }.resume()
        
       
        
    }
    
    
}
