//
//  NetCoinApp.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import SwiftUI

@main
struct NetCoinApp: App {
    let persistenceController = PersistenceController.shared
 
    var body: some Scene {
        WindowGroup {
           
            HomeView(netCoinViewModel: NetCoinViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
