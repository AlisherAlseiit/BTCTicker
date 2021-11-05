//
//  Model.swift
//  CoinTicker
//
//  Created by Алишер Алсейт on 05.11.2021.
//

import SwiftUI

struct Rate: Hashable,Decodable {
    
    
    var time: String
    var asset_id_base: String
    var asset_id_quote: String
    var rate: Double
   
    
}



