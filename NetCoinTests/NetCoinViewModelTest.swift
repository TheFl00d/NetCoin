
import XCTest
@testable import NetCoin
final class NetCoinViewModelTest: XCTestCase {
    var fakeNetworkManager: FakeManager?
    var netCoinViewModel : NetCoinViewModel!
    var endPoint = Endpoint()
    override func setUpWithError() throws {
        var fakeNetworkManager = FakeManager()

        netCoinViewModel = NetCoinViewModel(networkManager: fakeNetworkManager)
    }
    override func tearDownWithError() throws {
        fakeNetworkManager = nil
    }
    func testFetchCoinData(){
        Task {
            do{
                guard let fakeNetworkManager = fakeNetworkManager else{return}
                let coinRequest = try await fakeNetworkManager.fetchCoinData()
                
                
                XCTAssertEqual(coinRequest.0.count, 1 )
            } catch {
                print("❌\(error)")
                fatalError("Failed to return json")
            }
        }
        
    }
    
    func testAsyncRequestAllCoinsValues(){
        Task {
            do{
                guard let fakeNetworkManager = fakeNetworkManager else{return}
                let coinRequest = try await fakeNetworkManager.fetchCoinData()
                
                XCTAssertEqual(coinRequest.0[0].name, "bitcoin" )
            } catch {
                print("❌\(error)")
                fatalError("Failed to return json")
            }
        }
    }
 
}
