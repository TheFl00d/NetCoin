//
//  FakeRepository.swift
//  NetCoinTests
//
//  Created by Kwabena Ankamah on 15/12/2022.
//

import Foundation
@testable import NetCoin

class FakeRepository: NetCoinRepository {
    func getCoins(for url: URL) async throws -> [NetCoin] {
            let netCoinsData =  try await networkManager.get(url: url)
            
            let netCoins = try JSONDecoder().decode([NetCoin].self, from: netCoinsData )
            
            return netCoins
        }
    }
}
