
import Foundation
@testable import NetCoin




class FakeNetworkManager: NetworkActions {
    
    func fetchCoinData() async throws -> [NetCoinData] {

        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:"NetCoinResponse", withExtension: "json") else {
                return []}

            let data = try Data(contentsOf: path)
            
            let netCoinData = try JSONDecoder().decode([NetCoinData].self, from: data )
            
            return netCoinData
            
            
        } catch {
            print("❌\(error)")
             fatalError("Failed to return json")
            
        }
    }
   

}
