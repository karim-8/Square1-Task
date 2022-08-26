//
//  HomeScreen.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

class HomeScreenViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating {
    

    

    //MARK:- PROPERTIES
    var viewModel: HomeViewModel?
    private var coordinator: HomeCoordinator?
    @IBOutlet weak var citiesTableView: UITableView!
    //@IBOutlet weak var searchBar: UISearchBar!
    var pageNumber = 1
    var worldDataArray = [Items]()
    var filterdData = [Items]()
    let spinner = UIActivityIndicatorView()
    let searchBarController = UISearchController()
    
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchUserData()
        setupTableView()
        setuptTableViewCell()
        setupSearchData()
        updateView()
        setupSearchBar()
    }
    
    //MARK:- SETUP SEARCH BAR
    private func setupSearchBar() {
        title = "search"
        searchBarController.delegate = self
        searchBarController.searchResultsUpdater = self
        navigationItem.searchController = searchBarController
    }
    
    //MARK:- SETUP VIEW
    private func setupView() {
        coordinator = HomeCoordinator()
        viewModel = HomeViewModel(coordinator: coordinator ?? HomeCoordinator(), view: self)
    }
    
    //MARK:- FETCH USER DATA
     func fetchUserData() {
        view.addSubview(createSpinnerView())
        viewModel?.getData(page: pageNumber, isFilter: false, filteredText: "")
    }
    
    //MARK:- UPDATE VIEW
     func updateView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            if (viewModel?.getFullData().count)! > 0 {
                worldDataArray = viewModel?.getFullData() ?? [Items]()
                citiesTableView.reloadData()
                stopSpinner()
            }
        }
    }
    
    //MARK:- SETUP TABLE VIEW
    private func setupTableView() {
        citiesTableView.separatorColor = .blue
    }
    
    //MARK:- SETUP SEARCH BAR
    private func setupSearchData() {
       //searchBar.delegate = self
      // filterdData = fakeData
    }
    
    //MARK:- SETUP TABLE VIEW CELL
    private func setuptTableViewCell() {
        let nib = UINib(nibName: HomeTableViewCell.cellIdentifier, bundle: nil)
        citiesTableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
        citiesTableView.reloadData()
    }
    
    //MARK:- CREATE SPINNER VIEW
    func createSpinnerView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    //MARK:- LOAD SPINNER
    func loadSpinner() {
        self.citiesTableView.tableFooterView = createSpinnerView()
    }
    
    //MARK:- STOP SPINNER
    func stopSpinner() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.citiesTableView.tableFooterView = nil
        }
    }
    
 //MARK:- ADD MORE PAGES
    func addMorePages() {
                worldDataArray.append(contentsOf: viewModel?.getFullData() ?? [Items]())
                citiesTableView.reloadData()
                stopSpinner()
    }
    
    //MARK:- DEINIT
    deinit {
        viewModel = nil
    }
}
