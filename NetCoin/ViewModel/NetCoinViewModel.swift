//
//  NetCoinViewModel.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import Foundation
import Combine

class NetCoinViewModel: ObservableObject {
    @Published var coins: [NetCoinData] = []
    @Published var topMovingCoins: [NetCoinData] = []
    @Published var portfolioCoins: [NetCoinData] = []
    
    private let networkManger = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    init() {
        
        addCoinsSubscribers()
        addTopMoversSubscribers()
    }
 
    func addCoinsSubscribers() {
        networkManger.$coins.sink {
            [weak self] (returnedCoins) in
            self?.coins = returnedCoins
        }
        .store(in: &cancellables)
    }
    
    func addTopMoversSubscribers(){
        networkManger.$topMovingCoins.sink {
            [weak self] (returnedTopCoins) in
            self?.topMovingCoins = returnedTopCoins
        }
        .store(in: &cancellables)
    }
    
}
    
   

    
    
    

