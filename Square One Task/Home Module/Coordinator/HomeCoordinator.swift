//
//  HomeCoordinator.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import Foundation


import UIKit

protocol HomeCoordinatorProtocol {
    func navigateTo(view: UIViewController, lat: Double , long: Double)
}

class HomeCoordinator: HomeCoordinatorProtocol {
    
    //MARK:- PROPERTIES
   // let homeCoordinator = HomeCoordinator()
    
    
    //MARK:- NAVIGATE TO
    func navigateTo(view: UIViewController, lat: Double , long: Double) {

        //Instantiate the storyboard
        let mapViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "map") as? MapViewController

        //Any related data to the view
        mapViewController?.latitude = lat
        mapViewController?.longitiude = long

        //navigation proccess
        if let vc = mapViewController {
            let navigationController = UINavigationController(rootViewController:  vc)

            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .crossDissolve
            view.present(navigationController, animated: true, completion: nil)
        }
    }
}
