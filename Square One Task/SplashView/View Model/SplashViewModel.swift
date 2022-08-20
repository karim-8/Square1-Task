//
//  SplashViewModel.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit
import Foundation

protocol SplashViewModelProtocol {
    func animateSplashLogo(view: UIView, logo: UIImageView)-> UIImageView
    func animationExcution(view: UIView, logo: UIImageView)
}

class SplashViewModel: SplashViewModelProtocol {
    
    //PROPERTIES
    private let coordinator: SplashCoordinators?
    private let viewController: UIViewController?
    private var squareOneLogo = UIImageView()

    
    //MARK:- INIT
    init(coordinator: SplashCoordinators ,view: UIViewController) {
        self.coordinator = coordinator
        self.viewController = view
    }
    
    //MARK:- ANIMATE SPLASH LOGO
    func animateSplashLogo(view: UIView, logo: UIImageView) -> UIImageView {
        UIView.animate(withDuration: 3, animations: {
            let size = view.frame.size.width * 3
            let xScale = size - view.frame.size.width
            let yScale = view.frame.size.height - size
            
            logo.frame = CGRect(
                x: -(xScale/2),
                y: yScale/2,
                width: size,
                height: size
            )
        })
        animationExcution(view: view, logo: logo)
        return logo
    }
    
    //MARK:- ANIMATION EXCUTION
    func animationExcution(view: UIView, logo: UIImageView) {
        UIView.animate(withDuration: 3, animations: {
            logo.alpha = 0
        },completion: { animationDone in
            if animationDone {
                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                    self.coordinator?.navigateTo(view: self.viewController ?? UIViewController())
                })
            }
        })
    }
}
