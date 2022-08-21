//
//  HomeRepo.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation

/// Repo layer mission is get data wheter from
/// Remote           --       Data Base "Core Data"
class HomeRepo {
    
    //MARK:- GET USER DATA
    func getCitiesData(type: String) -> (Data?, Error?) {
        let parameters = type == "Home" ? "/users":"/users"
        let fullUrl = request(url: urlEndPoint.baseUrl.rawValue, param: parameters)
        var dataResult: Data?
        var errorResult: Error?
        
        
        NetworkClient().get(url: fullUrl) {  result in
            switch result {
            case .success(let data):
                print("Data from the view model is.....\(data)")
                dataResult = data
                //self?.decodeJsonResult(jsonData: data)
            case .failure(let error):
                errorResult = error
                print("Error while fetchhing data...\(error)")
            }
        }
        return (dataResult,errorResult)
    }
}
