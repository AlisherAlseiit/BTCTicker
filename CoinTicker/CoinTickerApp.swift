//
//  CoinTickerApp.swift
//  CoinTicker
//
//  Created by Алишер Алсейт on 05.11.2021.
//

import SwiftUI

@main
struct CoinTickerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentModel())
        }
    }
}
