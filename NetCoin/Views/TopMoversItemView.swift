//
//  TopMoversItemView.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import SwiftUI
import Kingfisher
struct TopMoversItemView: View {
    let coin: NetCoinData
    var body: some View {
        VStack(alignment: .leading) {
            //image
            KFImage(URL(string: coin.image))

                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            //coin info
            HStack{
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            //coin percentage change
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.title2)
                .foregroundColor(.green)
        }
        .frame(width: 140, height: 140)
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color(.systemGray4),lineWidth: 2
                   ))
    }
}
//
//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
