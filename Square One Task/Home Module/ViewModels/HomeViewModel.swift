//
//  HomeViewModel.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

protocol HomeViewModelProtocol {
    func getData()
}

class HomeViewModel: HomeViewModelProtocol {
    
    //PROPERTIES
    private var coordinator: HomeCoordinator?
    private var viewController: UIViewController
    var usecase = HomeUseCase()
    private var repo = HomeRepo()
    var dataNames = [Items]()
    
    //MARK:- INIT
    init(coordinator: HomeCoordinator, view: UIViewController) {
        self.coordinator = coordinator
        self.viewController = view
    }
    
    //MARK:- GET DATA
    //urlPath: URLRequest,completion: @escaping (Result<[Items],Error>)-> ()
    func getData() {
        
        usecase.getCitiesData(urlPath: urlPath) { [weak self] result in
            
            switch result {
            case .success(let data):
                self?.dataNames = data.data?.items ?? [Items]()
                completion(.success(self?.dataNames ?? [Items]()))
                return
                
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
    
    func setBaseUrl() -> URLComponents {
        var url = URLComponents(string: Constants.baseUrl)
        url?.queryItems = [
            URLQueryItem(name: "filter", value: Constants.filter),
            URLQueryItem(name: "page", value: "\(Constants.page)2"),
            URLQueryItem(name: "include", value: Constants.include)
        ]
        let test = Ur
        let fullUrl = URLRequest(url: url)
    }
    
    func getFullData() -> [Items] {
        return dataNames
    }
    
    ///http://connect-demo.mobile1.io/square1/connect/v1/city?
    ///filter[0]
    ///[name]
    ///[contains]=ka&page=2&include =country
    
    

}
