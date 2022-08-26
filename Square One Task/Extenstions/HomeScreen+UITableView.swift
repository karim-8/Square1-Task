//
//  HomeScreen+UITableView.swift
//  Square One Task
//
//  Created by Karim Soliman on 24/08/2022.
//

import UIKit

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return worldDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier, for: indexPath) as! HomeTableViewCell
        
        cell.countryLabel.text = worldDataArray[indexPath.row].name
        cell.cityLabel.text = worldDataArray[indexPath.row].country?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
