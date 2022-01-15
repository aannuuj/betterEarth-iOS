//
//  Endpoints.swift
//  betterEarth
//
//  Created by Hariom on 15/01/22.
//

import Foundation

struct Endpoint {
    
    static let uploadURL = API_Model.init(path: "upload/new",
                                          httpMethod: .post,
                                          isRawData: true)
    
    static let getHome = API_Model.init(path: "home",
                                        httpMethod: .get,
                                        isRawData: false)
    
//    static let delete = API_Model.init(path: "",
//                                       httpMethod: .delete,
//                                       isRawData: false)
//
//    static let update = API_Model.init(path: "",
//                                       httpMethod: .put,
//                                       isRawData: true)
}
