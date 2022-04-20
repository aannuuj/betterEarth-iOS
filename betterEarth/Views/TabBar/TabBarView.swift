//
//  TabBarView.swift
//  betterEarth
//
//  Created by Hariom Palkar on 20/04/22.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showPopUp = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                switch viewRouter.currentPage {
                case .home:
                    HomeView()
                        .animation(.easeIn)
                case .camera:
                    CameraView(viewRouter: viewRouter)
                        .animation(.easeIn)
                case .compensate:
                    CompensateViewController()
                        .scaleEffect(1.0)
                        .animation(.easeInOut(duration: 2), value: 1.0)
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


//TODO: // Improve on hstack
//HStack {
//    ForEach((0..<Page.allCases.count)) { index in
//        TabBarIcon(viewRouter: viewRouter, assignedPage: , iconName: "home")
//    }
//}
