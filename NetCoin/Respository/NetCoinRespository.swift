
import Foundation
import Combine

protocol NetCoinRepository {
    func getCoins(for url: URL) async throws -> [NetCoin]
}
final class NetCoinRepositoryImpl {
    private let networkManager: NetworkActions
    private var cancellables = Set<AnyCancellable>()
    init(networkManager: NetworkActions) {
        self.networkManager = networkManager
    }
}
extension NetCoinRepositoryImpl: NetCoinRepository {
    func getCoins(for url: URL) async throws -> [NetCoin] {
        let netCoinsData =  try await networkManager.get(url: url)
        let netCoins = try JSONDecoder().decode([NetCoin].self, from: netCoinsData )
        return netCoins
    }
}
