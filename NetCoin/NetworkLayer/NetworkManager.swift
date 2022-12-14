
import Foundation
import Combine
enum NetworkError: Error {
    case parsingFailed
    case invalidUrl
}
protocol NetworkActions {
    func get(url: URL) async throws -> Data
    func fetchCoinData() async throws -> [NetCoin]
}
class NetworkManager: NetworkActions   {
    func get(url: URL) async throws -> Data {
        do {
            let (data,_) = try await  URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkError.parsingFailed
        
        }
    }
    
  
    func fetchCoinData() async throws -> [NetCoin] {
        guard let url = Endpoint.coinUrl else {
            throw NetworkError.invalidUrl
        }
        do {
            let (data,_) = try await  URLSession.shared.data(from: url)
            
            let netCoinData = try JSONDecoder().decode([NetCoin].self, from: data )
            return netCoinData
        } catch {
            throw NetworkError.parsingFailed
        
        }
    }

}








