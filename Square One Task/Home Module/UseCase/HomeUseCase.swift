//
//  HomeUseCase.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation

class HomeSearchUseCase {
    var userInfo = [CitiesDataModel]()

    //- Call the usecase get the data from tuple
    //- get data
    //- pasrse it the send it to the vm
    //- set the qp from vm to here
    
    let repository: HomeRepo?
    
    init(repo: HomeRepo) {
        repository = repo
    }
    
    //MARK:- GET SEARCH DATA
    func getSearchData() {
        repository?.getCitiesData(type: "")
    }
    
    //MARK:- DECODE JSON RESULT
    private func decodeJsonResult(jsonData: Data) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let userdata = try? decoder.decode([CitiesDataModel].self, from: jsonData)
        if let data = userdata {
            self.userInfo = data
        }
    }
}
