//
//  ContentView.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0){
            HomeHeaderNoteCell()
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.white)
                .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
                .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 3)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    AnalyticsSubView()
                        .shadow(color: .black.opacity(0.03), radius: 12, x: 0, y: 3)
                    ActivityView()
                }
            }
        }.background(Color.BEBackground)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

