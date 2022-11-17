//
//  HomeView.swift
//  NetCoin
//
//  Created by Kwabena Ankamah on 14/11/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var netCoinViewModel = NetCoinViewModel()
    
    @State private var showPortfolio: Bool = false
   
    var body: some View {
       
            VStack {
         homeHeader
                
                Spacer(minLength: 0)
                ScrollView(.vertical, showsIndicators: false) {
                    //top movers view
                    TopMoversView(netCoinViewModel: netCoinViewModel)
                    
                    Divider()
                    //all coins view
                    AllCoinsView(netCoinViewModel: netCoinViewModel)
               
            }
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(netCoinViewModel: NetCoinViewModel())
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(CircleButtonAnimationVIew(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Net Coin Portfolio" : "Net Coin Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
