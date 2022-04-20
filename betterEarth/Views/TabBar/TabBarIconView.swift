//
//  TabBarIcon.swift
//  betterEarth
//
//  Created by Hariom Palkar on 20/04/22.
//

import SwiftUI

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
