//
//  AllCoinsView.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var netCoinViewModel: NetCoinViewModel
    @Binding var showPortfolio: Bool
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
            
        
                VStack {
                    List {
                        ForEach(netCoinViewModel.coins) { coin in
                            CoinCellView(coin: coin, showHoldingsColumn: showPortfolio)
//                                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
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
