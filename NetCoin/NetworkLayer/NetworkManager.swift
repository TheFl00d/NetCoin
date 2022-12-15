
import Foundation
import Combine
enum NetworkError: Error {
    case parsingFailed
    case invalidUrl
}
protocol NetworkActions {
    func get(url: URL) async throws -> Data
    
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
    
  
    

}








