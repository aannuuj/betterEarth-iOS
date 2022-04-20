//
//  AnalyticsSubView.swift
//  betterEarth
//
//  Created by Hariom Palkar on 20/04/22.
//

import SwiftUI

struct AnalyticsSubView: View {
    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 36)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 48, height: 450)
                .padding(24)
            VStack {
                //TODO: make the view here
                Image("homeActivity")
                    .frame(width: UIScreen.main.bounds.width - 96, height: 350)
            }
        }
    }
}
