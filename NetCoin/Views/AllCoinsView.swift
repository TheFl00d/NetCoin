//
//  AllCoinsView.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var netCoinViewModel: NetCoinViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            HStack {
                Text("Coin")
                Spacer()
                Text("Prices")
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(netCoinViewModel.coins) { coin in
                        CoinCellView(coin: coin, showHoldingsColumn: true)
                    }
                }
            }
        }
        
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
