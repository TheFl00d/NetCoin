//
//  HomeView.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var netCoinViewModel = NetCoinViewModel()
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                //top movers view
                TopMoversView(netCoinViewModel: netCoinViewModel)
                
                Divider()
                //all coins view
                AllCoinsView(netCoinViewModel: netCoinViewModel)
            }.navigationTitle("Live Prices")
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(netCoinViewModel: NetCoinViewModel())
    }
}
