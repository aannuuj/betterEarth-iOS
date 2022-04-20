//
//  ActivitySubView.swift
//  betterEarth
//
//  Created by Hariom Palkar on 20/04/22.
//

import SwiftUI

struct ActivityView: View {
    //TODO:  get activity from viewModel
    let activity = [
        RecentActivity(imageName: "tropicana", productName: "Tropicana Juice Box 1L", offsetted: false, carbonValue: "24lbs", addedTime: "Just Now"),
        RecentActivity(imageName: "lays", productName: "Lays Blue Chlips", offsetted: false, carbonValue: "21lbs", addedTime: "1 day ago"),
        RecentActivity(imageName: "redbull", productName: "Redbull Tin Can", offsetted: true, carbonValue: "4lbs", addedTime: "2 day ago")
    ]
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            HStack {
                Text("Activity")
                    .font(.EuleHeading)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {}){
                    Image("filterIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                }
            }
            .padding(24)
            
            ForEach(activity, id: \.self) { item in
                // pass the object here and handel it inside the cell
                RecentActivityCell(dataModel: item)
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(36, corners: [.topLeft, .topRight])
    }
}
