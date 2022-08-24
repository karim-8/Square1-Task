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
    var pageNumber = 1
    var worldData = [Items]()
    

    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchUserData()
        setupTableView()
        setuptTableViewCell()
        setupSearchData()
        updateView()
    }
    
    //MARK:- SETUP VIEW
    private func setupView() {
        coordinator = HomeCoordinator()
        viewModel = HomeViewModel(coordinator: coordinator ?? HomeCoordinator(), view: self)
    }
    
    //MARK:- FETCH USER DATA
    private func fetchUserData() {
        viewModel?.getData(page: pageNumber)
    }
    
    //MARK:- UPDATE VIEW
    private func updateView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            worldData = viewModel?.getFullData() ?? [Items]()
            citiesTableView.reloadData()
        }
    }
    
    //MARK:- SETUP TABLE VIEW
    private func setupTableView() {
        citiesTableView.separatorColor = .blue
    }
    
    //MARK:- SETUP SEARCH BAR
    private func setupSearchData() {
       searchBar.delegate = self
      // filterdData = fakeData
    }
    
    //MARK:- SETUP TABLE VIEW CELL
    private func setuptTableViewCell() {
        let nib = UINib(nibName: HomeTableViewCell.cellIdentifier, bundle: nil)
        citiesTableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
        citiesTableView.reloadData()
    }
    
    //MARK:- DEINIT
    deinit {
        viewModel = nil
    }
}



extension HomeScreenViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > citiesTableView.contentSize.height-100-scrollView.frame.size.height {
            pageNumber+=1
            viewModel?.getData(page: pageNumber)
            updateView()
            
        }
    }
}
