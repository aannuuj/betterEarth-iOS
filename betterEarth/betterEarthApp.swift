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
                .shadow(color: .black.opacity(0.06), radius: 22, x: 0, y: -3)
        }
    }
}


