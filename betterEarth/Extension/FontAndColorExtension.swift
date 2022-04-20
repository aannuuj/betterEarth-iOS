//
//  FontAndColorExtension.swift
//  betterEarth
//
//  Created by Hariom Palkar on 26/03/22.
//

import Foundation
import SwiftUI

fileprivate func EuleFont(_ weight: Font.Weight = .regular, _ size: CGFloat = 14) -> Font {
    return Font.custom("Sofia Pro", size: size).weight(weight)
}


extension Font{
    static var EuleHeading: Font {
        return  EuleFont(.bold, 22)
    }
    static var EuleBulkHeading: Font {
        return  EuleFont(.bold, 28)
    }
    static var EuleTitle: Font {
        return EuleFont(.regular, 14)
    }
    static var EuleTitle2: Font {
        return EuleFont(.regular, 16)
    }
    static var BETitle: Font {
        return EuleFont(.bold, 20)
    }
    static var BESubTitle: Font {
        return EuleFont(.ultraLight, 12)
    }
    static var BELabel: Font {
        return EuleFont(.medium, 14)
    }
    static var  EuleTabBar: Font {
        return EuleFont(.medium, 12)
    }
    
    //market place
    static var LargeHeadline: Font {
        return EuleFont(.heavy, 24)
    }
    static var subHeader: Font {
        return EuleFont(.regular, 14)
    }
    static var Label: Font {
        return EuleFont(.medium, 18)
    }
    static var LabelBold: Font {
        return EuleFont(.bold, 20)
    }
    static var EuleLabelBold: Font {
        return EuleFont(.bold, 18)
    }
    static var EuleDesc: Font {
        return EuleFont(.light, 12)
    }
}


extension Color {
    static var BEGreen: Color {
        return Color(red: 0.20, green: 0.65, blue: 0.51)
    }
    static var BEGrey: Color {
        return Color(red: 0.47, green: 0.47, blue: 0.47)
    }
    static var BEBackground: Color {
        return Color(red: 0.95, green: 0.95, blue: 0.95)
    }
    static var White: Color {
        return Color(red: 1.0, green: 1.0, blue: 1.0)
    }
    
}

extension UIColor {
    static var BEGreen: UIColor {
        return UIColor(red: 0.20, green: 0.65, blue: 0.51, alpha: 1.00)
    }
    static var BEGrey: UIColor {
        return UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
    }
    static var BEBackground: UIColor{
        return UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    }
    static var White: UIColor {
        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.00)
    }
}


extension LinearGradient {
//    static var EuleGradient: LinearGradient{
//        return LinearGradient(gradient: Gradient(colors: [.EuleGreen, .EuleBlue]), startPoint: .leading, endPoint: .trailing)
//    }
//    static var BackgroundGradient: LinearGradient{
//        return LinearGradient(gradient: Gradient(colors: [.flippedStart, .flippedEnd]), startPoint: .leading, endPoint: .trailing)
//    }
//    static var CVVGradient: LinearGradient{
//        return LinearGradient(gradient: Gradient(colors: [.backWhite, .backGrey]), startPoint: .leading, endPoint: .trailing)
//    }
}
