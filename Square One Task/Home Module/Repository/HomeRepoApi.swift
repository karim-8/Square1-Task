//
//  HomeRepo.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation

protocol HomeRepoProtocol {
    func getCitiesData(urlPath: URLRequest,completion: @escaping (Result<CitiesDataModel,Error>)-> ())
}
class HomeRepo: HomeRepoProtocol {
    
    //MARK:- PROPERTIES
    let remote = HomeRemote()
    var remoteData = CitiesDataModel()

    
    //MARK:- GET CITIES DATA
    func getCitiesData(urlPath: URLRequest,completion: @escaping (Result<CitiesDataModel,Error>)-> ()) {
 
        remote.getCitiesData(urlPath: urlPath) { result in
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
