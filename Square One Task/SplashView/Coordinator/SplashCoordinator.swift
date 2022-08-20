//
//  SplashCoordinator.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

protocol SplashCoordinatorProtocol {
    func navigateTo(view: UIViewController)
}

class SplashCoordinators: SplashCoordinatorProtocol {
    
    //MARK:- PROPERTIES
    let homeCoordinator = HomeCoordinator()
    
    
    //MARK:- NAVIGATE TO
    func navigateTo(view: UIViewController) {
        let viewModel: HomeViewModel = HomeViewModel(coordinator: homeCoordinator, view: view)

        //Instantiate the storyboard
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as? HomeScreenViewController
        homeViewController?.viewModel =  viewModel

        if let vc = homeViewController {
            let navigationController = UINavigationController(rootViewController:  vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .crossDissolve
            view.present(navigationController, animated: true, completion: nil)
        }
    }
}
