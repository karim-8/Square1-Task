//
//  HomeScreen.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //MARK:- PROPERTIES
    var viewModel: HomeViewModel?
    private var coordinator: HomeCoordinator?
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var fakeData = ["Karims","Madlene","Tomhas"]
    var filterdData: [String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTableView.separatorColor = .blue
        setuptTableViewCell()
        setupSearchData()
    }
    
    private func setupSearchData() {
       searchBar.delegate = self
       filterdData = fakeData
    }
    
    //MARK:- Setup Table View Cell
    private func setuptTableViewCell() {
        let nib = UINib(nibName: HomeTableViewCell.cellIdentifier, bundle: nil)
        citiesTableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
        citiesTableView.reloadData()
    }
}


extension HomeScreenViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return filterdData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.countryLabel.text = filterdData?[indexPath.row]
        cell.cityLabel.text = filterdData?[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100

    }
    
    
}

extension HomeScreenViewController {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     filterdData = []
        
        if searchText == "" {
            filterdData = fakeData
        }
        
        for word in fakeData {
            if word.uppercased().contains(searchText.uppercased()) {
                filterdData?.append(word)
            }
        }
        citiesTableView.reloadData()
    }
}
