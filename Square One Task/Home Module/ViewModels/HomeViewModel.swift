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
    func getData() {
        usecase.getCitiesData(urlPath: setFullDataUrl()) { [weak self] result in
            switch result {
            case .success(let data):
                self?.dataNames = data.data?.items ?? [Items]()
                return
                
            case .failure(let error):
                print("Errrrror is ....\(error)")
                //View Alert controller with error
               /// completion(.failure(error))
                return
            }
        }
    }
    
    func setFullDataUrl() -> request {
        let baseUrl = Constants.baseUrl
        let paramters = "\(Constants.filter)ka&\(Constants.page)2&\(Constants.include)"
     return request(url: baseUrl, param: paramters)
        //https://connect-demo.mobile1.io/square1/connect/v1/city?filter%5B0%5D%5Bname%5D%5Bcontains%5D=ka&page=2&include=country
    }
    
    func getFullData() -> [Items] {
        return dataNames
    }
}
