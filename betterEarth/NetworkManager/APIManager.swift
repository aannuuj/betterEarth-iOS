//
//  APIManager.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import UIKit
import Alamofire
import SwiftyJSON

let noInternetConnectionMsg = "Connection error."

// MARK: API Manager Delegate

protocol ApiManagerDelegate: class {
    func didFinishCallingApiWithFailer(_ path: String)
    func receiveData(_ jsonData: AnyObject?, path: String)
}

// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any]

class APIManager: NSObject {
    
    weak var delegate: ApiManagerDelegate! = nil
    static let authUsername: String = ""
    static let authPassword: String = ""
    var isPrintApiData : Bool = false
    
    func getMainHeaders() -> HTTPHeaders {
        var mainHeaders: HTTPHeaders
        mainHeaders = [:]
        mainHeaders["Content-Type"] = "application/json"
        mainHeaders["Authorization"] = AppData.token
        return mainHeaders
    }
    
    static let sharedInstance: APIManager = {
        let instance = APIManager()
        return instance
    }()
    
    func callAPI(apiModel: API_Model, param: Parameters?,completion completionBlock: ApiResponseHandler? = nil){
        let endPoint = ServerEnvironment.active.baseURL
        self.executeApi(endPoint+apiModel.newPath, param: param, apiMethod: apiModel.method, forDelegate: nil, userName: APIManager.authUsername, passWord: APIManager.authPassword, isRawData: apiModel.isRawData, completion: completionBlock)
    }
    
    func executeApi(_ path: String, param: Parameters?, apiMethod : HTTPMethod = .get, forDelegate: ApiManagerDelegate? = nil, userName : String = authUsername, passWord : String = authPassword, isRawData : Bool = false, completion completionBlock: ApiResponseHandler? = nil){
        delegate = forDelegate
        if Reach().isInternet() == true {
            print("API=>\(path)")
            print("Parameter=>\(param)")
            let headers: HTTPHeaders = getMainHeaders()
            print("Headers ==> \(headers)")
            var parEncoding: ParameterEncoding = (apiMethod == .get ? URLEncoding.default : URLEncoding.default)  // URLEncoding.httpBody was before
        
            if isRawData == true {
                parEncoding = JSONEncoding.default
            }
            
            print("Encoding ==? \(parEncoding)")
            
            //For SSL
            var newParam : Parameters!
            newParam = (param != nil) ?  param : [:]
            
            AF.request(path, method: apiMethod, parameters: newParam, encoding:parEncoding, headers: headers).responseJSON { (response) in
                switch response.result{
                case .success:
                    do{
                        let json = try JSONSerialization.jsonObject(with: response.data!, options: [])
                        self.responseSend(isSuccess: true, apiStatusCode: response.response?.statusCode, path: path, resultData: json as AnyObject, param: param, completionBlock: completionBlock)
                        print(json)
                    }catch let error{
                        self.failMessageSend(path: path, completionBlock: completionBlock, errorMsg: error.localizedDescription)
                        print(error.localizedDescription)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            self.failMessageSend(path: path, completionBlock: completionBlock, errorMsg: WebServiceCallErrorMessage.ErrorInternetConnectionNotAvailableMessage)
        }
    }
    
    
    func responseSend(isSuccess : Bool, apiStatusCode : Int?, path : String, resultData : AnyObject?, param : Parameters?, completionBlock : ApiResponseHandler?) {
        var newIsSuccess : Bool = isSuccess
        if apiStatusCode == 200 {
            newIsSuccess = true
        }
        
        if newIsSuccess == false {
            self.isPrintApiData = true
        }
        
        if apiStatusCode == 401 {  // Unauthorization
            if let completionBlock = completionBlock {
                let isValid : Bool = false
                if let resultData = resultData {
                    completionBlock(isValid, JSON.init(resultData), apiStatusCode)
                } else {
                    completionBlock(isValid, JSON.init([:]), apiStatusCode)
                }
            }
            guard newIsSuccess else {
                self.delegate?.didFinishCallingApiWithFailer(path)
                return
            }
            self.delegate?.receiveData(resultData!, path: path)
        } else {
            if let completionBlock = completionBlock {
                let isValid : Bool = false
                if let resultData = resultData {
                    completionBlock(isValid, JSON.init(resultData), apiStatusCode)
                } else {
                    completionBlock(isValid, JSON.init([:]), apiStatusCode)
                }
            }
            guard newIsSuccess else {
                self.delegate?.didFinishCallingApiWithFailer(path)
                return
            }
            self.delegate?.receiveData(resultData!, path: path)
        }
    }
    
    func failMessageSend(path: String, completionBlock: ApiResponseHandler?, errorMsg: String = noInternetConnectionMsg) {
        self.delegate?.didFinishCallingApiWithFailer(path)
        if let completionBlock = completionBlock {
            completionBlock(false, JSON.init(["message":errorMsg]), nil)
        }
    }
    
    func printText(_ text: Any) {
        if isPrintApiData {
            print(text)
        }
    }
}
