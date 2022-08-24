//
//  NetworkService.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation

class NetworkClient {
    
    func get(url: RequestProtocol, completion: @escaping (Result<Data,Error>)-> ()) {
         
        let requesturl = URLRequest(url: url.url)

        URLSession.shared.dataTask(with: requesturl) { (data, response, error) in
            if error != nil {
                completion(.failure(NetwrokError.netwrokError))
                return
            }
            guard let data = data else {
                completion(.failure(NetwrokError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}





