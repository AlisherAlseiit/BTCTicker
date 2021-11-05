//
//  ContentView.swift
//  CoinTicker
//
//  Created by Алишер Алсейт on 05.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    
    var body: some View {
        NavigationView {
            
            VStack{
//                VStack (spacing: 25) {
                    
                    ForEach(model.rates, id: \.self) { rate in
                        VStack (alignment: .leading, spacing: 25) {
                        Text("1 \(rate.asset_id_base) = \(Int(rate.rate)) \(rate.asset_id_quote)")
                        .frame(width: getScreenBounds().width-60, height: 25)
                        .padding(10)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5).foregroundColor(.blue)
                        )
                       

                    }
                    
                    Spacer()
                    
                    Picker("some", selection: $model.selection) {
                        Text("USD")
                            .tag("USD")
                            
                        Text("EUR")
                            .tag("EUR")
                        Text("AUD")
                            .tag("AUD")
                        Text("BRL")
                            .tag("BRL")
                        Text("CAD")
                            .tag("CAD")
                        Text("CNY")
                            .tag("CNY")
                        Text("ZAR")
                            .tag("ZAR")
                    }
                    
                    .pickerStyle(WheelPickerStyle())
                    
                    
                    
                }
                .foregroundColor(.white)
                
        
                
            
            
            
            
            
            
        }
        .onChange(of: model.selection) { newValue in
            model.rates = [Rate]()
            model.fetchSpecificRate(first: "BTC", second:  model.selection)
            model.fetchSpecificRate(first: "ETH", second: model.selection)
            model.fetchSpecificRate(first: "LTC", second: model.selection)
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}

extension View {
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
}

