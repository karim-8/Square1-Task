//
//  NetworkHelper.swift
//  Square One Task
//
//  Created by Karim Soliman on 21/08/2022.
//

import Foundation

enum urlEndPoint: String {
    case baseUrl = "http://connect-demo.mobile1.io/square1/connect/v1/city"
}


struct request: RequestProtocol {
    let baseUrl: String?
    let qParameters: String?
    
    init(url: String, param: String){
        self.baseUrl = url
        self.qParameters = param
    }
    var url: URL {
        return URL(string: baseUrl! + qParameters!)!
    }
    
    
}
