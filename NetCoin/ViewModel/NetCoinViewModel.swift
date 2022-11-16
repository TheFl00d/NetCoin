//
//  NetCoinViewModel.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import Foundation
import Combine

class NetCoinViewModel: ObservableObject {
    @Published var coins = [NetCoinData]()
    @Published var topMovingCoins = [NetCoinData]()
  
    init() {
        
        fetchCoinData()
    }
    
   

    func fetchCoinData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h") else {
            
            return
            
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌DEBUG: Error \(error.localizedDescription)")
            }
            if let response = response as? HTTPURLResponse {
                print("❌DEBUG: Response code \(response.statusCode)")
            }
            
            guard let data = data else {return}
            
            do {
                let coins = try JSONDecoder().decode([NetCoinData].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
                
            } catch let error {
                print("❌DEBUG: Failed to decode with error:  \(error)")
            }
            
        }.resume()
        
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(8))
    }
    
 
    
    }
    
    
    

