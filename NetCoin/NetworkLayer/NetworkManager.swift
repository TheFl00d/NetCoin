
import Foundation
import Combine
enum NetworkError: Error {
    case parsingFailed
    case invalidUrl
}
protocol NetworkActions {
    func fetchCoinData() async throws -> [NetCoinData]
}
class NetworkManager: NetworkActions   {
    func fetchCoinData() async throws -> [NetCoinData] {
        guard let url = URL(string: Endpoint.coinUrl) else {
            throw NetworkError.invalidUrl
        }
        do {
            let (data,_) = try await  URLSession.shared.data(from: url)
            
            let netCoinData = try JSONDecoder().decode([NetCoinData].self, from: data )
            return netCoinData
        } catch {
            throw NetworkError.parsingFailed
        
        }
    }

}







