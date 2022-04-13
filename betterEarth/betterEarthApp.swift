//
//  betterEarthApp.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import SwiftUI

@main
struct betterEarthApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}


struct TabBarView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Text("Home Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
                .tag(0)
            CameraView()
                .tabItem {
                    Text("Camera Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
                .tag(1)
                
            CompensateViewController()
                .tabItem {
                    Text("Bookmark Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
                .tag(2)
        }
        .accentColor(.BEGreen)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
}

// can this be enum?

//struct TabBarItemView: View {
//    @State private var selection : Int
//    @State private var view : View
//
//    var body: some View {
//        Text("Home Tab")
//            .font(.system(size: 30, weight: .bold, design: .rounded))
//    }
//}
