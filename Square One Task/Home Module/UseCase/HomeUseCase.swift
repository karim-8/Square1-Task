//
//  HomeUseCase.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation

protocol HomeUseCaseProtocol {
    func getCitiesData(urlPath: RequestProtocol,completion: @escaping (Result<CitiesDataModel,Error>)-> ())
}

class HomeUseCase: HomeUseCaseProtocol {
    
    //MARK- PROPERTIES
    let repo = HomeRepo()
    
    //MARK:- GET SEARCH DATA
    func getCitiesData(urlPath: RequestProtocol,completion: @escaping (Result<CitiesDataModel,Error>)-> ()) {
        
        repo.getCitiesData(urlPath: urlPath) {  result in
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
