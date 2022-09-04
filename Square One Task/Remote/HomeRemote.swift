//
//  HomeRemote.swift
//  Square One Task
//
//  Created by Karim Soliman on 22/08/2022.
//

import Foundation

protocol HomeRemoteProtocol {
    func getCitiesData(urlPath: RequestProtocol,completion: @escaping (Result<CitiesDataModel,Error>)-> ())
}

class HomeRemote: HomeRemoteProtocol {
    
    var remoteData = [CitiesDataModel]()

    func getCitiesData(urlPath: RequestProtocol, completion: @escaping (Result<CitiesDataModel,Error>)-> ()) {

        NetworkClient().get(url: urlPath) { [weak self] result in
            switch result {
                
            case .success(let data):
                var testData = JsonDataDecoder().decodeJsonResult(jsonData: data, model: [CitiesDataModelElement]().self)
                
                print("Data are..... ${}")
                print(testData)
                
                //completion(.success(self?.remoteData ?? CitiesDataModel()))
                return
                
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
}
