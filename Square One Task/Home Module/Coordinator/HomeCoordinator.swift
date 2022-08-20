//
//  HomeCoordinator.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation


import UIKit

protocol HomeCoordinatorProtocol {
    func navigateTo(view: UIViewController)
}

class HomeCoordinator: HomeCoordinatorProtocol {
    
    //MARK:- PROPERTIES
   // let homeCoordinator = HomeCoordinator()
    
    
    //MARK:- NAVIGATE TO
    func navigateTo(view: UIViewController) {
//        let viewModel: HomeViewModel = HomeViewModel(coordinator: HomeCoordinator, view: view)
//
//        //Instantiate the storyboard
//        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as? HomeScreenViewController
//
//        //Any related data to the view
//        homeViewController?.viewModel =  viewModel
//
//        //navigation proccess
//        if let vc = homeViewController {
//            let navigationController = UINavigationController(rootViewController:  vc)
//
//            navigationController.modalPresentationStyle = .fullScreen
//            navigationController.modalTransitionStyle = .crossDissolve
//            view.present(navigationController, animated: true, completion: nil)
//        }
    }
}
