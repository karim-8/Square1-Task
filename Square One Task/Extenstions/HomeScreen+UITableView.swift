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
        
       // cell.view = view
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Destination is ... \n \(worldDataArray[indexPath.row].lat) \n \(worldDataArray[indexPath.row].lng)")
        coordinator?.navigateTo(view: self, lat: worldDataArray[indexPath.row].lat ?? 0.0, long: worldDataArray[indexPath.row].lng ?? 0.0)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
