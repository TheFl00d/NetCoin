

import Foundation
import Combine

protocol NetCoinViewModelAction: AnyObject, ObservableObject {
    func fetchCoins(urlStr: String)
}

final class NetCoinViewModel {
    @Published private var coins: [NetCoin] = []
    @Published private(set) var filteredCoins: [NetCoin] = []
    @Published var searchText: String = ""

    private let repository: NetCoinRepository
    private var cancellables = Set<AnyCancellable>()
    
    var topMovingCoins: [NetCoin]  {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        return Array(topMovers.prefix(8))
    }
    
    init(repository: NetCoinRepository) {
        self.repository = repository
    }
}

extension NetCoinViewModel: NetCoinViewModelAction {
    func fetchCoins(urlStr: String) {
        guard let url = URL(string: urlStr) else {
            return
        }
        Task {
            do {
                let netCoins = try await repository.getCoins(for: url)
                dataToPublisher(allCoinsData: netCoins)
            }catch {
                // handle error
            }
        }
    }
}
   
extension NetCoinViewModel {
    private func dataToPublisher(allCoinsData: [NetCoin]) {
         DispatchQueue.main.async {
             self.coins = allCoinsData
             self.filteredCoins = allCoinsData
             self.addCoinsSubscribers(searchText: self.searchText, filteredCoins: self.filteredCoins)
         }
     }
     
     private func addCoinsSubscribers(searchText: String, filteredCoins: [NetCoin]) {
         $searchText
             .combineLatest($filteredCoins)
             .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
             .map{ (text, filteredCoins) -> [NetCoin] in
                 guard !text.isEmpty else {
                     return self.coins
                 }
                 let lowercasedText = text.lowercased()
                 
                 return filteredCoins.filter{(coin) -> Bool in
                     return coin.name.lowercased().contains(lowercasedText) ||
                     coin.symbol.lowercased().contains(lowercasedText) ||
                     coin.id.lowercased().contains(lowercasedText)
                 }
             }
            .sink{
                 [weak self] (returnedCoins) in
                 self?.filteredCoins = returnedCoins
             }
             .store(in: &cancellables)
     }
}
    
    
