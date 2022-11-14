//
//  NetCoinViewModel.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import Foundation
import Combine

class NetCoinViewModel: ObservableObject {
    @Published var netCoinData: [NetCoinData]?
    private var networkManager: NetworkAction
    private let endpoint = Endpoint()
    
    init(networkManager: NetworkAction) {

        self.networkManager = networkManager
    }
    
    func getNetCoinData() async throws {
        do {
           netCoinData = try await networkManager.getCoinData(url: endpoint.coinUrl)
            
        } catch {
            throw NetworkError.parsingFailed
        }
    }
    
}
