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

class HomeViewModel {
    
    //PROPERTIES
    private var coordinator: HomeCoordinator?
    private var viewController: UIViewController
    var usecase = HomeUseCase()
    private var repo = HomeRepo()
    var dataNames = [Items]()
    var isPaginating = false
    var lastPage = 0
    var currentPage = 1
    
    //MARK:- INIT
    init(coordinator: HomeCoordinator, view: UIViewController) {
        self.coordinator = coordinator
        self.viewController = view
    }
    
    //MARK:- GET DATA
    func getData(page: Int, isFilter: Bool, filteredText: String) {
        isPaginating = true
            usecase.getCitiesData(urlPath: setFullDataUrl(pageNum: page, isFilter: isFilter, filterText: filteredText)) { [weak self] result in
                switch result {
                case .success(let data):
                    self?.dataNames = data.data?.items ?? [Items]()
                    self?.isPaginating = false
                    return
                    
                case .failure(let error):
                    self?.isPaginating = false
                    //View Alert controller with error
                   /// completion(.failure(error))
                    return
                }
            }
    }
    
    func setFullDataUrl(pageNum: Int, isFilter: Bool, filterText: String) -> request {
        let baseUrl = Constants.baseUrl
        let paramters = "\(Constants.filter)ka&\(Constants.page)\(pageNum)&\(Constants.include)"
        let filterParameters = "\(Constants.filter)\(filterText)"
        return request(url: baseUrl, param: isFilter ? filterParameters : paramters )
    }
    
    
    func getFullData() -> [Items] {
        return dataNames
    }
    
    func calculateViewPosition (postion: CGFloat, height: CGFloat, page: Int)
    -> Bool {
        if isPaginating == false && postion > height && page < 15 {
            currentPage+=1
            getData(page: currentPage, isFilter: false, filteredText: "")
            print(dataNames.count)
            return true
        }
        return false
    }
}
