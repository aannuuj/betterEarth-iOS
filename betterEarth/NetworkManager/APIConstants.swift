//
//  APIConstants.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias ApiResponseHandler = (_ success: Bool, _ result : JSON, _ responseCode : Int?) -> Void

class API_Model: NSObject {
    
    var path        : String!
    var newPath     : String!
    var method      : HTTPMethod = .post
    var isRawData   : Bool = true
    var paramKey    : [String]?
    
    init(path : String, httpMethod : HTTPMethod = .post, isRawData : Bool = true, param : [String]? = nil) {
        self.path       = path
        self.method     = httpMethod
        self.isRawData  = isRawData
        paramKey        = param
    }
    
    func callAPI(param : Parameters?, paramStr : String? = nil, completion completionBlock: ApiResponseHandler? = nil) {
        
        if let paramStr = paramStr {
            newPath = path+paramStr
        } else {
            newPath = path
        }
        
        APIManager.sharedInstance.callAPI(apiModel: self, param: param, completion: completionBlock)
    }
}

struct WebServiceCallErrorMessage {
    static let ErrorInvalidDataFormatMessage = "Please try again, server not reachable"
    static let ErrorServerNotReachableMessage = "Server Not Reachable"
    static let ErrorInternetConnectionNotAvailableMessage = "OOPS! Looks like you don't have internet access at this moment"
    static let ErrorTitleInternetConnectionNotAvailableMessage = "Network Error"
    static let ErrorNoDataFoundMessage = "No Data Available"
    static let ErrorOccuredMessage = "Error occurred! Please try again"
}


