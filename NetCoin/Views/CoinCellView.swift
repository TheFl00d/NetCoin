//
//  CoinCellView.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import SwiftUI
import Kingfisher
struct CoinCellView: View {
    let coin: NetCoinData
    var body: some View {
        HStack {
            //market cap
            Text("\(coin.marketCapRank ?? 1)")
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            //coin name info
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2 )
            
            Spacer()
            // coin price info
            
            VStack(alignment: .trailing, spacing: 4) {
                
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(.red)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//struct CoinCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinCellView()
//    }
//}
