//
//  HomeRepo.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation
import UIKit

protocol HomeRepoProtocol {
    func getCitiesData(urlPath: RequestProtocol, completion: @escaping (Result<CitiesDataModel,Error>)-> ())
}

extension HomeRepoProtocol {
    func addDatainDB(){}
    func getDataFromDB (){}
}
class HomeRepo: HomeRepoProtocol {
    
    //MARK:- PROPERTIES
    let remote = HomeRemote()
    var remoteData = CitiesDataModel()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cachedData = CitiesDataModel()
    var citiesData = [CitiesData]()
    
    //MARK:- GET CITIES DATA
    func getCitiesData(urlPath: RequestProtocol, completion: @escaping (Result<CitiesDataModel,Error>)-> ()) {
 
        remote.getCitiesData(urlPath: urlPath) { [weak self] result in
            switch result {
            case .success(let data):
                self?.removeAllData()
                self?.saveData(data: data)
                self?.remoteData = JsonDataDecoder().decodeJsonResult(jsonData: data, model: CitiesDataModel())
                completion(.success(self?.remoteData ?? CitiesDataModel()))
                return
                
            case .failure(let error):
                self?.cachedData = self?.getDataFromDB() ?? CitiesDataModel()
                if !(self?.cachedData.data?.items?.isEmpty ?? false) {
                    completion(.success(self?.cachedData ?? CitiesDataModel()))
                }else {
                    completion(.failure(error))
                }
                return
            }
        }
    }
}

