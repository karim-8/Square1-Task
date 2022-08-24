//
//  HomeFilterUseCase.swift
//  Square One Task
//
//  Created by Karim Soliman on 21/08/2022.
//

import Foundation
protocol HomeSearchUseCaseProtocol {
    func getSearchData(urlPath: URLRequest,completion: @escaping (Result<CitiesDataModel,Error>)-> ())
}

class HomeSearchUseCase: HomeSearchUseCaseProtocol {
    
    //MARK- PROPERTIES
    let repo = HomeRepo()
    
    //MARK:- GET SEARCH DATA
    func getSearchData(urlPath: URLRequest,completion: @escaping (Result<CitiesDataModel,Error>)-> ()) {
        
        repo.getCitiesData(urlPath: urlPath) {  result in
            switch result {
            case .success(let data):
                print("Succcccccess from useCase")
                completion(.success(data))
                return
                
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
}
