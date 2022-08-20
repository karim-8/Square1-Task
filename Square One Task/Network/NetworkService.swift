//
//  NetworkService.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation

//- URL as a parameter or in protocol
//- get request
//- Return handler

protocol RequestProtocol {
    //url - qp - interceptors - ....
    var url:URL {get}
}
enum NetwrokError: Error {
    case noData
    case netwrokError
}

class NetworkClient {
    
    func get(url: RequestProtocol, completion: @escaping (Result<Data,Error>)-> ()) {
         
        let requesturl = URLRequest(url: url.url)

        URLSession.shared.dataTask(with: requesturl) { (data, response, error) in
            //Error case returned
            if error != nil {
                completion(.failure(NetwrokError.netwrokError))
                return
            }
            //No Data case
            guard let data = data else {
                completion(.failure(NetwrokError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}





