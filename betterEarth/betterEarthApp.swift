//
//  betterEarthApp.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import SwiftUI

@main
struct betterEarthApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            TabBarView(viewRouter: viewRouter)
        }
    }
}


struct TabBarView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    @State var showPopUp = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                switch viewRouter.currentPage {
                case .home:
                    HomeView()
                case .camera:
                    CameraView(viewRouter: viewRouter)
                case .compensate:
                    CompensateViewController()
                }
                HStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .home, iconName: "home")
                    Spacer()
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .camera, iconName: "camera")
                    Spacer()
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .compensate, iconName: "compensate")
                }
                .frame(width: geometry.size.width, height: 80)
                .background(Color.black)
                .cornerRadius(24, corners: [.topLeft, .topRight])
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: ViewRouter())
    }
}


struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    @State var iconName: String
    let size: CGFloat = 36
    
    var body: some View {
        VStack {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .padding(.top, 10)
        }
        .padding(.horizontal, 30)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? .white : .gray)
    }
}


//struct TabBarView: View {
//    @State private var selection = 1
//    var body: some View {
//        TabView(selection: $selection) {
//            HomeView()
//                .tabItem {
//
////                    Text("Home Tab")
////                        .font(.system(size: 30, weight: .bold, design: .rounded))
//                }
//                .tag(0)
//            CameraView()
//                .tabItem {
////                    Text("Camera Tab")
////                        .font(.system(size: 30, weight: .bold, design: .rounded))
//                }
//                .tag(1)
//
//            CompensateViewController()
//                .tabItem {
//                    Text("compensate")
//                        .font(.system(size: 30, weight: .bold, design: .rounded))
//                }
//                .tag(2)
//        }
//        .cornerRadius(12)
//        .accentColor(.BEGreen)
//        .onAppear() {
//            UITabBar.appearance().barTintColor = .white
//        }
//    }
//}





