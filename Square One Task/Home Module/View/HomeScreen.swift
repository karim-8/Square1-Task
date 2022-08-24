//
//  HomeScreen.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

class HomeScreenViewController: UIViewController {

    //MARK:- PROPERTIES
    var viewModel: HomeViewModel?
    private var coordinator: HomeCoordinator?
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var fakeData = ["Karims","Madlene","Tomhas"]
    var filterdData: [String]?
    
    var worldData = [Items]()
    

    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setuptTableViewCell()
        setupSearchData()
        
    }
    
    //MARK:- SETUP TABLE VIEW
    private func setupTableView() {
        citiesTableView.separatorColor = .blue
    }
    
    //MARK:- SETUP SEARCH BAR
    private func setupSearchData() {
       searchBar.delegate = self
       filterdData = fakeData
    }
    
    //MARK:- SETUP TABLE VIEW CELL
    private func setuptTableViewCell() {
        let nib = UINib(nibName: HomeTableViewCell.cellIdentifier, bundle: nil)
        citiesTableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
        citiesTableView.reloadData()
    }
    
    //MARK:- FETCH USER DATA
    private func fetchUserData() {
        viewModel?.getData()
    }
    
    private func getDaa() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            userData = viewModel?.getUserData() ?? [UsersDataModel]()
            dataListItems.reloadData()
        }
    }
    
    //MARK:- DEINIT
    deinit {
        viewModel = nil
    }
}



