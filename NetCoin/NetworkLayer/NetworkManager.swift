//
//  NetworkManager.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import Foundation
import Combine



protocol NetworkActions {
    func fetchCoinData() async throws -> ([NetCoinData], [NetCoinData])
}

class NetworkManager: NetworkActions   {
    
 
           
    func fetchCoinData() async throws -> ([NetCoinData], [NetCoinData]) {
            guard let url = URL(string: Endpoint.coinUrl) else {
                
                return ([],[])
                
            }
        do {
            let (data,_) = try await  URLSession.shared.data(from: url)
            
            let netCoinData = try JSONDecoder().decode([NetCoinData].self, from: data )
            let topMovers = configureTopMovingCoins(coins: netCoinData)
            return (netCoinData,topMovers)
            
            
        } catch {
//           throw NetworkError.parsingFailed
            
        }
        return ([],[])
       
     
        }
    func configureTopMovingCoins(coins: [NetCoinData]) -> [NetCoinData] {
            let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
            return Array(topMovers.prefix(8))
        }
        
        
        
    }
    

    
    
    


