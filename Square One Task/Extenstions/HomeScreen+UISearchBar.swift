//
//  HomeScreen+SearchBar.swift
//  Square One Task
//
//  Created by Karim Soliman on 24/08/2022.
//

import UIKit

extension HomeScreenViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     filterdData = []
        
        if searchText == "" {
            filterdData = worldDataArray
        }else {
            viewModel?.getData(page: pageNumber, isFilter: true, filteredText: searchText)
            worldDataArray.append(contentsOf: viewModel?.getFullData() ?? [Items]())
            citiesTableView.reloadData()
        }
        
        
        //call the view model with the url ++ new qp's
        
//        for word in fakeData {
//            if word.uppercased().contains(searchText.uppercased()) {
//                filterdData?.append(word)
//            }
//        }
        //citiesTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchBarController.searchBar.text else {
            return
        }
        filterdData = []
    
           if searchBarController.searchBar.text == "" {
               fetchUserData()
               updateView()
               print("Im back herererre")
               filterdData = worldDataArray
           }else {
               viewModel?.getData(page: pageNumber, isFilter: true, filteredText: searchBarController.searchBar.text!)
               worldDataArray = viewModel?.getFullData() ?? [Items]()
               //worldDataArray.append(contentsOf: viewModel?.getFullData() ?? [Items]())
               citiesTableView.reloadData()
           }
    }
}

