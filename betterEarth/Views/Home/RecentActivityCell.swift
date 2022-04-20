//
//  RecentActivityCell.swift
//  betterEarth
//
//  Created by Hariom Palkar on 26/03/22.
//

import SwiftUI

struct RecentActivityCell: View {
    let dataModel : RecentActivity
    var body: some View {
        HStack {
            Image(dataModel.imageName)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 44, height: 44)
                 .cornerRadius(12)
            VStack(alignment: .leading, spacing: 4){
                Text(dataModel.productName)
                    .font(.Label)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(dataModel.offsetted ? "Offseted" : "Un-offsetted")
                    .font(.subHeader)
                    .foregroundColor(dataModel.offsetted ? .gray : .black)
                    .lineLimit(1)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text(dataModel.carbonValue)
                    .font(.Label)
                    .foregroundColor(.BEGreen)
                    .lineLimit(1)
                Text(dataModel.addedTime)
                    .font(.subHeader)
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
        }
        .padding(.horizontal, 14)
        .frame(width: UIScreen.main.bounds.width - 48, height: 80)
        .background(Color.BEGrey.opacity(0.1))
        .cornerRadius(10)
    }
}

struct RecentActivityCell_Previews: PreviewProvider {
    static var previews: some View {
        RecentActivityCell(dataModel: RecentActivity(imageName: "tropicana", productName: "tropicana", offsetted: false, carbonValue: "24lbs", addedTime: "2hrs ago"))
    }
}
