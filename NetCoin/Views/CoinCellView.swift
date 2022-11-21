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
    let showHoldingsColumn: Bool
    var body: some View {
        HStack(spacing: 0) {
           
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            // coin price info
            
           rightColumn
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
        .font(.subheadline)
    }
}

extension CoinCellView {
    private var leftColumn: some View {
        HStack (spacing: 0) {
            //market cap
            Text("\(coin.marketCapRank ?? 1)")
                .padding()
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
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.toCurrency())
                .bold()
            Text((coin.currentHoldings ?? 0).toCurrency())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing, spacing: 4) {
            
            Text(coin.currentPrice.toCurrency())
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 4)
            
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.caption)
                .padding(.leading, 6)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .padding(.leading, 2)
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}



//struct CoinCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinCellView(coin: , showHoldingsColumn: true)
//    }
//}
