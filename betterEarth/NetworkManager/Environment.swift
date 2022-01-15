//
//  Environment.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import Foundation
import SwiftUI

public enum ServerEnvironment: String, Codable, Hashable {
    public static var active: Self {
        .production
    }
    case temporary
    case debug
    case staging
    case production
    case local
}

extension ServerEnvironment {
    public var baseURL: String {
        switch self {
        case .temporary:
            return String("")
        case .debug:
            return String("")
        case .staging:
            return String("")
        case .production:
            return String("")
        case .local:
            return String("")
        }
    }
}
