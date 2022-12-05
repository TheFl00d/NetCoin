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
        Task {
            //rename tuple
            let (data1, data2) =  try await networkManger.fetchCoinData()
            
            coins = data1
            topMovingCoins = data2
            
            addCoinsSubscribers()
            addTopMoversSubscribers()
        }
       
    
    }
    
 
    func addCoinsSubscribers() {
        $coins.receive(on: DispatchQueue.main).sink {
            
            [weak self] (returnedCoins) in
            self?.coins = returnedCoins
        }
        .store(in: &cancellables)
    }
    
    func addTopMoversSubscribers(){
        $topMovingCoins.receive(on: DispatchQueue.main).sink {
            [weak self] (returnedTopCoins) in
            self?.topMovingCoins = returnedTopCoins
        }
        .store(in: &cancellables)
    }
    
}
    
   

    
    
    

