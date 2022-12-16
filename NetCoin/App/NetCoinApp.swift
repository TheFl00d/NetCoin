
import SwiftUI

@main
struct NetCoinApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView(netCoinViewModel: NetCoinViewModel(repository: NetCoinRepositoryImpl(networkManager: NetworkManager())))
                    .navigationBarHidden(true)
            }
            
        }
    }
}
