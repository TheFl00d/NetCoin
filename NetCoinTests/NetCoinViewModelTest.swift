
import XCTest
@testable import NetCoin
final class NetCoinViewModelTest: XCTestCase {
    let networkManager = FakeManager()
    var netCoinViewModel : NetCoinViewModel!
    var endPoint = Endpoint()
    override func setUpWithError() throws {
        
        netCoinViewModel = NetCoinViewModel(networkManager: networkManager)
    }
    func testAsyncRequestAllCoinsData(){
        Task {
            do{
                let coinRequest = try await networkManager.fetchCoinData()
                
                
                XCTAssertEqual(coinRequest.0.count, 1 )
            } catch {
                print("❌\(error)")
                fatalError("Failed to return json")
            }
        }
        
    }
    func testAsyncRequestTopMoversData(){
        Task {
            do{
                let coinRequest = try await networkManager.fetchCoinData()
                XCTAssertEqual(coinRequest.1.count, 1 )
            } catch {
                print("❌\(error)")
                fatalError("Failed to return json")
            }
        }
    }
    func testAsyncRequestAllCoinsValues(){
        Task {
            do{
                let coinRequest = try await networkManager.fetchCoinData()
                
                XCTAssertEqual(coinRequest.0[0].name, "bitcoin" )
            } catch {
                print("❌\(error)")
                fatalError("Failed to return json")
            }
        }
    }
    func testAsyncRequestTopMoverValues(){
        Task {
            do{
                let coinRequest = try await networkManager.fetchCoinData()
                let percentageChange = coinRequest.1[0].priceChangePercentage24H
                XCTAssertEqual(percentageChange, -0.62665 )
            } catch {
                print("❌\(error)")
                fatalError("Failed to return json")
            }
        }
    }
}
