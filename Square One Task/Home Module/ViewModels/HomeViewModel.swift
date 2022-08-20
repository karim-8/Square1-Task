//
//  HomeViewModel.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

protocol HomeViewModelProtocol {
    func animateSplashLogo(view: UIView, bevyLogo: UIImageView)-> UIImageView
    func animationExcution(view: UIView, bevyLogo: UIImageView)
}

class HomeViewModel {
    
    //PROPERTIES
    private var coordinator: HomeCoordinator?
    private var viewController: UIViewController
    
    //MARK:- INIT
    init(coordinator: HomeCoordinator, view: UIViewController) {
        self.coordinator = coordinator
        self.viewController = view
    }
    
}
