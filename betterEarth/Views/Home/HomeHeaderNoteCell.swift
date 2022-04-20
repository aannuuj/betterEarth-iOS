//
//  HomeHeaderNoteCell.swift
//  betterEarth
//
//  Created by Hariom Palkar on 26/03/22.
//


import SwiftUI

struct HomeHeaderNoteCell: View {
    let username = "Hariom"
    var body: some View {
        HStack {
            // add a network image
            Image("redbull")
                 .resizable()
                 .foregroundColor(.gray)
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 36, height: 36)
                 .cornerRadius(18)
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome back, \(username)!")
                    .font(.BETitle)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text("Have a great day ;)")
                    .font(.BESubTitle)
                    .foregroundColor(.BEGrey)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}

struct HomeHeaderNoteCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderNoteCell()
    }
}
