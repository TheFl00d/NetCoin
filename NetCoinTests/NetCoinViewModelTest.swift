
import XCTest
@testable import NetCoin
final class NetCoinViewModelTest: XCTestCase {
    var fakeNetworkManager: FakeNetworkManager?
    var netCoinViewModel : NetCoinViewModel!
    
    override func setUpWithError() throws {
        fakeNetworkManager = FakeNetworkManager()

        netCoinViewModel = NetCoinViewModel(networkManager: fakeNetworkManager!)
        
    }
    override func tearDownWithError() throws {
        fakeNetworkManager = nil
    }
    func testFetchCoinData(){
        Task {
            do{
                guard let fakeNetworkManager = fakeNetworkManager else { return }

                let coinRequest = try await fakeNetworkManager.fetchCoinData()
                
                print(coinRequest)
                XCTAssertEqual(coinRequest.count, 1)
            } catch {
                print("❌\(error)")
                fatalError("Failed to return json")
            }
        }
        
    }
    
    func testFetchCoinDatatAllCoinsValues(){
        Task {
            guard let fakeNetworkManager = fakeNetworkManager else { return }

            do{
               
                let coinRequest = try await fakeNetworkManager.fetchCoinData()
                print(coinRequest)
                XCTAssertEqual(coinRequest[0].name, "bitcoin" )
            } catch {
                print("❌\(error)")
                fatalError("Failed to return json")
            }
        }
    }
    
    func testConfigureTopMovingCoins(){
        
        Task {
            guard let fakeNetworkManager = fakeNetworkManager else { return }
            let allCoinsData =  try await fakeNetworkManager.fetchCoinData()
            netCoinViewModel.dataToPublisher(allCoinsData: allCoinsData)
            var topMovers = allCoinsData.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
            topMovers = Array(topMovers.prefix(8))
            print(topMovers[0].name )
            let topMoversCount = topMovers.count
            XCTAssertEqual(topMoversCount, 7 )
//            XCTAssertNotEqual(topMovers.count, 1)
        }
      
    }
 
}
