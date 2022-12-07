//
//  FakeNetworkManager.swift
//  NetCoinTests
//
//  Created by Kwabena Ankamah on 06/12/2022.
//


import Foundation
@testable import NetCoin




class FakeManager: NetworkActions {
    
    func fetchCoinData() async throws -> ([NetCoinData], [NetCoinData]) {

        do {
            let bundle = Bundle(for: FakeManager.self)
            guard let path =  bundle.url(forResource:"NetCoinResponse", withExtension: "json") else {
                return ([],[])}

            let data = try Data(contentsOf: path)
            
            let netCoinData = try JSONDecoder().decode([NetCoinData].self, from: data )
            let topMovers = configureTopMovingCoins(coins: netCoinData)
            return (netCoinData,topMovers)
            
            
        } catch {
            print("❌\(error)")
             fatalError("Failed to return json")
            
        }
    }
    func configureTopMovingCoins(coins: [NetCoinData]) -> [NetCoinData] {
            let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
            return Array(topMovers.prefix(8))
        }

}
