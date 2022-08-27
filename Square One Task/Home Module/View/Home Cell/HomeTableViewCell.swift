//
//  HomeTableViewCell.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    //PROPERTIES
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    var view = HomeScreenViewController()
    static let cellIdentifier = "HomeTableViewCell"
    var currentLat = 0
    var currentLng = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func mapViewTapped(_ sender: Any) {
        ///view map screen
     //   navigateTo()
    }
    
    //MARK:- NAVIGATE TO
    func navigateTo() {
        print("I have been calllled")
        
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! MapViewController
//        present(nextViewController, animated:true, completion:nil)
        
        //let viewModel: HomeViewModel = HomeViewModel(coordinator: homeCoordinator, view: view)
//
//        //Instantiate the storyboard
//        let mapViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "map") as? MapViewController
//
//        mapViewController?.latitude = currentLat
//        mapViewController?.longitiude = currentLng
//
//
//
//
//
//        if let vc = mapViewController {
//            let navigationController = UINavigationController(rootViewController:  vc)
//            navigationController.modalPresentationStyle = .fullScreen
//            navigationController.modalTransitionStyle = .crossDissolve
//            navigationController.pushViewController(vc, animated: false)
//        }

//        if let vc = mapViewController {
//            let navigationController = UINavigationController(rootViewController:  vc)
//            navigationController.modalPresentationStyle = .fullScreen
//            navigationController.modalTransitionStyle = .crossDissolve
//            view.present(navigationController, animated: true, completion: nil)
//        }
    }
}
/*
 let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
 let vc = storyBoard.instantiateViewController(withIdentifier: "YourViewController") as! YourViewController
 self.navigationController?.pushViewController(vc, animated: true)
 */
