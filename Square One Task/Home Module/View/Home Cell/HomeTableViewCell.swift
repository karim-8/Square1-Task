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
        
    }
}
