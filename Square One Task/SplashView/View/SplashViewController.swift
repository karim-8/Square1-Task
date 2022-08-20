//
//  ViewController.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- PROPERTIES
    private var squareOneLogo = UIImageView()
    private var viewModel: SplashViewModel?
    private var coordinator = SplashCoordinators()

    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setBackgroundColor()
        createSplashLogo()
    }
    
    //MARK:- SETUP VIEW
    private func setupView() {

        viewModel = SplashViewModel(coordinator: coordinator, view: self)
    }
    
    //MARK:- VIEW DID LAYOUT SUBVIEW
    override func viewDidLayoutSubviews() {
      squareOneLogo.center = view.center
    }
    
    //MARK:- VIEW DID APPEAR
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.squareOneLogo = self.viewModel?.animateSplashLogo(view: self.view, logo: self.squareOneLogo) ?? UIImageView()
        })
    }
    
    //MARK:- SET BACKGROUND COLOR
    private func setBackgroundColor() {
        view.backgroundColor = .black
    }
    
    //MARK:- CRETATE SPLASH LOGO
    private func createSplashLogo() {
        squareOneLogo = {
            let logoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
            logoImage.image = UIImage(named: "logo")
            logoImage.sizeToFit()
            return logoImage
        }()
        view.addSubview(squareOneLogo)
    }
    
    //MARK:- DEINIT
    deinit {
        viewModel = nil
    }

}

