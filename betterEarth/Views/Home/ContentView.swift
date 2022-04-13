//
//  ContentView.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import SwiftUI

struct RecentActivity: Hashable, Identifiable {
    let id = UUID()
//    let type: String
    let imageName: String
    let productName: String
    let offsetted: Bool
    let carbonValue: String
    let addedTime: String
}

private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]



struct HomeView: View {
    let activity = [
        RecentActivity(imageName: "tropicana", productName: "Tropicana Juice Box 1L", offsetted: false, carbonValue: "24lbs", addedTime: "Just Now"),
        RecentActivity(imageName: "lays", productName: "Lays Blue Chlips", offsetted: false, carbonValue: "21lbs", addedTime: "1 day ago"),
        RecentActivity(imageName: "redbull", productName: "Redbull Tin Can", offsetted: true, carbonValue: "4lbs", addedTime: "2 day ago")
    ]
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        VStack{
            HomeHeaderNoteCell()
                .padding(.leading, 24)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 36)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 48, height: 450)
                            .padding(24)
                        VStack {
                            Image("homeActivity")
                                .frame(width: UIScreen.main.bounds.width - 96, height: 350)
//                            LazyVGrid(columns: threeColumnGrid) {
//                                Text("Activity")
//                            }
                        }
                        // add activity insights view here
                    }
                   
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
                            //TODO:  get activity from viewModel
                            ForEach(activity, id: \.self) { item in
                                // pass the object here and handel it inside the cell
                                RecentActivityCell(dataModel: item)
                            }
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(36, corners: [.topLeft, .topRight])
                }
                .background(Color.gray.opacity(0.1))
            }
        }
        }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

