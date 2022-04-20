//
//  HomeHeaderNoteCell.swift
//  betterEarth
//
//  Created by Hariom Palkar on 26/03/22.
//


import SwiftUI
import SDWebImageSwiftUI

struct HomeHeaderNoteCell: View {
    let username = "Hariom"
    let url = "https://i.picsum.photos/id/391/200/300.jpg?hmac=3xP-y2PRN2E0__aPOCp1sja7XrimKgLQAMiSaNd0Cko"
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: url))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray.opacity(0.3))
                }
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .frame(width: 36, height: 36)
                .cornerRadius(18)
                .padding(.leading, 24)
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome back, \(username)!")
                    .font(.BETitle)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text("Have a great day ;)")
                    .font(.BELabel)
                    .foregroundColor(.BEGrey)
                    .lineLimit(1)
            }
            Spacer()
        }
        .padding(.vertical, 10)
        
    }
        
}

struct HomeHeaderNoteCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderNoteCell()
    }
}
