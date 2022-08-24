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

