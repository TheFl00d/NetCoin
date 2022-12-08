
import Foundation
import Combine
class NetCoinViewModel: ObservableObject {
    @Published var coins: [NetCoinData] = []
    @Published var filteredCoins: [NetCoinData] = []
    @Published var topMovingCoins: [NetCoinData] = []
    @Published var portfolioCoins: [NetCoinData] = []
    @Published var searchText: String = ""
    private let networkManager: NetworkActions
    private var cancellables = Set<AnyCancellable>()
    init(networkManager: NetworkActions) {
        self.networkManager = networkManager
        Task {
            //rename tuple
            let (allCoinsData, topMoversData) =  try await networkManager.fetchCoinData()
            dataToPublisher(allCoinsData: allCoinsData, topMoversData: topMoversData)
        }
    }
    func dataToPublisher(allCoinsData: [NetCoinData], topMoversData: [NetCoinData]){
        DispatchQueue.main.async {
            self.coins = allCoinsData
            self.topMovingCoins = topMoversData
            self.filteredCoins = self.coins
            self.addCoinsSubscribers()
            self.addTopMoversSubscribers()
        }
    }
    func addCoinsSubscribers() {
        $searchText
            .combineLatest($filteredCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map{ (text, filteredCoins) -> [NetCoinData] in
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
    func addTopMoversSubscribers(){
        $topMovingCoins.receive(on: DispatchQueue.main).sink {
            [weak self] (returnedTopCoins) in
            self?.topMovingCoins = returnedTopCoins
        }
        .store(in: &cancellables)
    }
}
   

    
    
    


    
 
   
    
    

