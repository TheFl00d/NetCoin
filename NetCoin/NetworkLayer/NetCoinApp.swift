
import SwiftUI

@main
struct NetCoinApp: App {
    let persistenceController = PersistenceController.shared
 
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView(netCoinViewModel: NetCoinViewModel(repository: NetCoinRepositoryImpl(networkManager: NetworkManager())))
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .navigationBarHidden(true)
            }
            
        }
    }
}
