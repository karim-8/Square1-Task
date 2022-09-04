//
//  HomeRepo+DB.swift
//  Square One Task
//
//  Created by Karim Soliman on 04/09/2022.
//

import Foundation
import UIKit


extension HomeRepo {
    ///DB CRUD OPERATIONS
   //MARK:- Add DATA IN DB
    func saveData(data: Data) {
        let item = CitiesData(context: context)
        item.citiesJosn = data
        appDelegate.saveContext()
    }
    
    
    //MARK:- GET DATA FROM DB
     func getDataFromDB () -> CitiesDataModel {

        do {
            let dbData = try context.fetch(CitiesData.fetchRequest())
            let fetchedData = dbData.first?.citiesJosn
            if let data = fetchedData {
                self.cachedData = JsonDataDecoder().decodeJsonResult(jsonData: data, model: CitiesDataModel())
            }
        }catch {
            print("error fetching data")
        }
        return cachedData
    }
    
    //MARK:- REMOVE ALL DATA
     func removeAllData() {
        let item = CitiesData(context: self.context)
        self.context.delete(item)
    }
}
