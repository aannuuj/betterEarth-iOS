//
//  RouterModel.swift
//  betterEarth
//
//  Created by Hariom Palkar on 20/04/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}


enum Page: CaseIterable{
    case home
    case camera
    case compensate
}
