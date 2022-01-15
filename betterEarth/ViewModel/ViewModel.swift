//
//  ViewModel.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import SwiftUI
import UIKit
import SwiftyJSON
import Combine


class viewModel: ObservableObject {
    
    @Published var featuredImage: UIImage?
    var responseImageURL = String()
    var homeData = [HomeModel]()
    
    func endImage_upload() {
        let image : UIImage = featuredImage!
        //Now use image to create into NSData format
        let imageData = image.jpegData(compressionQuality: 0.1)!
        let imgformat = ImageFormat.get(from: imageData)
        
        var strBase64 = image.toBase64(type: UIImage.Format(rawValue: imgformat.rawValue)!, quality: 0.1, addMimePrefix: true)
        strBase64 = String(strBase64!.filter { !" \n\t\r".contains($0) })
        strBase64 = strBase64!.filter { !$0.isWhitespace }
        
        let params = ["file_name": "productImage.png",
                      "base64_src": strBase64!]
        
        Endpoint.uploadURL.callAPI(param: params){ (isSuccess, result, responseCode)  in
            if result["success"].boolValue == true {
                self.responseImageURL = result["payload"]["url"].stringValue.replacingOccurrences(of: "\\", with: "")
            } else {
                let message = result["error"][0]["message"].string ?? ""
                print(message)
            }
        }
    }
    
    func getHome(uid: String) {
        Endpoint.getHome.callAPI(param: nil, paramStr: "?uid=\(uid)") { (isSuccess, result, responseCode)  in
            if result["success"].boolValue == true {
                let payload = result["payload"]
                let jsonData = getDataFrom(JSON: payload)
                if let data = jsonData {
                    do {
                        let decodedResponse = try JSONDecoder().decode([HomeModel].self, from: data)
                        DispatchQueue.main.async {
                            self.homeData = decodedResponse
                        }
                        return
                    } catch let jsonError as NSError {
                        print("JSON decode failed: \(jsonError.localizedDescription)")
                    }
                    return
                }
            }
        }
    }
}
