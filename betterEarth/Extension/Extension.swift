//
//  Extension.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import Foundation
import UIKit
import SwiftyJSON
import SwiftUI

extension UIImage {

  enum Format: String {
    case png = "png"
    case jpeg = "jpeg"
    case jpg = "jpg"
  }

  func toBase64(type: Format = .jpeg, quality: CGFloat = 1, addMimePrefix: Bool = false) -> String? {
    let imageData: Data?
    switch type {
      case .jpeg: imageData = jpegData(compressionQuality: quality)
      case .png:  imageData = pngData()
      case .jpg: imageData = jpegData(compressionQuality: quality)
    }
    guard let data = imageData else { return nil }

    let base64 = data.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)

    var result = base64
    if addMimePrefix {
      let prefix = "data:image/\(type.rawValue);base64,"
      result = prefix + base64
    }
    return result
  }
}


enum ImageFormat: String {
  case png, jpg, gif, tiff, webp, heic, unknown
}

extension ImageFormat {
  static func get(from data: Data) -> ImageFormat {
    switch data[0] {
      case 0x89:
        return .png
      case 0xFF:
        return .jpg
      case 0x47:
        return .gif
      case 0x49, 0x4D:
        return .tiff
      case 0x52 where data.count >= 12:
        let subdata = data[0...11]

        if let dataString = String(data: subdata, encoding: .ascii),
           dataString.hasPrefix("RIFF"),
           dataString.hasSuffix("WEBP")
        {
          return .webp
        }

      case 0x00 where data.count >= 12 :
        let subdata = data[8...11]

        if let dataString = String(data: subdata, encoding: .ascii),
           Set(["heic", "heix", "hevc", "hevx"]).contains(dataString)
        {
          return .heic
        }
      default:
        break
    }
    return .unknown
  }

  var contentType: String {
    return "image/\(rawValue)"
  }
}

public func getDataFrom(JSON json: JSON) -> Data? {
    do {
        return try json.rawData(options: .prettyPrinted)
    } catch _ {
        return nil
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
