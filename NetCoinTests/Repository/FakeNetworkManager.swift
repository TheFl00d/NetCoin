
import Foundation
@testable import NetCoin




class FakeNetworkManager: NetworkActions {
   
        func get(url: URL) async throws -> Data {
            do {
                let (data,_) = try await  URLSession.shared.data(from: url)
                return data
            } catch {
                throw NetworkError.parsingFailed
            
            }
        }
    }
    
    
    func fetchCoinData() async throws -> [NetCoin] {

        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:"NetCoinResponse", withExtension: "json") else {
                return []}

            let data = try Data(contentsOf: path)
            
            let netCoinData = try JSONDecoder().decode([NetCoin].self, from: data )
            
            return netCoinData
            
            
        } catch {
            print("❌\(error)")
             fatalError("Failed to return json")
            
        }
    }
   


