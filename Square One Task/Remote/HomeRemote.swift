//
//  HomeRemote.swift
//  Square One Task
//
//  Created by Karim Soliman on 22/08/2022.
//

import Foundation
import UIKit

protocol HomeRemoteProtocol {
    func getCitiesData(urlPath: RequestProtocol,completion: @escaping (Result<Data,Error>)-> ())
}

class HomeRemote: HomeRemoteProtocol {
    
    var remoteData = CitiesDataModel()
    

    func getCitiesData(urlPath: RequestProtocol, completion: @escaping (Result<Data,Error>)-> ()) {

        NetworkClient().get(url: urlPath) {  result in
            switch result {
                
            case .success(let data):
                completion(.success(data))
                return
                
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
}
