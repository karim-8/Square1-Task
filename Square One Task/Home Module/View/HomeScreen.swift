//
//  HomeScreen.swift
//  Square One Task
//
//  Created by Karim Soliman on 20/08/2022.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK:- PROPERTIES
    var viewModel: HomeViewModel?
    private var coordinator: HomeCoordinator?
    @IBOutlet weak var citiesTableView: UITableView!
    var fakeData = ["city1","city2","city3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTableView.separatorColor = .blue
        setuptTableViewCell()
    }
    
    //MARK:- Setup Table View Cell
    private func setuptTableViewCell() {
        let nib = UINib(nibName: HomeTableViewCell.cellIdentifier, bundle: nil)
        citiesTableView.register(nib, forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
        citiesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fakeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier, for: indexPath) as! HomeTableViewCell
        
        cell.countryLabel.text = fakeData[indexPath.row]
        cell.cityLabel.text = fakeData[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100

    }
}
