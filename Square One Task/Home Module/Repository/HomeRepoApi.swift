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
    var cachedData = CitiesDataModel2()
    var citiesData = [CitiesData]()
    
    //MARK:- GET CITIES DATA
    func getCitiesData(urlPath: RequestProtocol, completion: @escaping (Result<CitiesDataModel,Error>)-> ()) {
 
        remote.getCitiesData(urlPath: urlPath) { [weak self] result in
            switch result {
            case .success(let data):
                //self?.cachedData = data
                self?.addDatainDB()
                completion(.success(data))
                return
                
            case .failure(let error):
               // self?.cachedData = self?.getDataFromDB() ?? CitiesDataModel2()
                if !(self?.citiesData.isEmpty ?? false) {
                  //  completion(.success(self?.cachedData ?? CitiesDataModel2()))
                }else {
                    completion(.failure(error))
                }
                return
            }
        }
    }
}


///Seperate in files
extension HomeRepo {
    ///DB CRUD OPERATIONS
   //MARK:- Add DATA IN DB
    private func addDatainDB() {
        let cityNamesArr = cachedData.data?.items
        if let cities = cityNamesArr {
            for name in 0..<cities.count  {
                let item = CitiesData(context: context)
                item.name = cityNamesArr?[name].name
                item.country = cityNamesArr?[name].country?.name
                item.lat = Double((cityNamesArr?[name].lat) ?? 0.0)
                item.lng = Double((cityNamesArr?[name].lng) ?? 0.0)
                
                //Data Converted to string
                
                //1-   let dataToString =  String(decoding: data, as: UTF8.self)
                
                //2- Save data in ""DB"" here with string format
                
                //3- When fetching cast it back to the codable model

                appDelegate.saveContext()
            }
        }
    }
    
    //MARK:- GET DATA FROM DB
    private func getDataFromDB () -> CitiesDataModel {
        var retrivedData = CitiesDataModel()
     //   retrivedData.data = DataClass()
      //  retrivedData.data?.items = [Items]()
        do {
            
            /// - - - > Do not do this save as string data instead of relations < - - -
            
            citiesData = try context.fetch(CitiesData.fetchRequest())
            for index in 0..<citiesData.count  {
                
                let data = [Items(id: nil, name: citiesData[index].name, local_name: nil, lat: citiesData[index].lat, lng: citiesData[index].lng, created_at: nil, updated_at: nil, country_id: nil, country: Country(id: nil, name: citiesData[index].country, code: nil, created_at: nil, updated_at: nil, continent_id: nil))]
                
               // retrivedData.data?.items?.append(contentsOf: data)
            }
        }catch {
            print("error fetching data")
        }
        return retrivedData
    }
    
    //MARK:- REMOVE ALL DATA
    private func removeAllData() {
        for x in 0..<citiesData.count  {
            context.delete(citiesData[x])
        }
    }
}
