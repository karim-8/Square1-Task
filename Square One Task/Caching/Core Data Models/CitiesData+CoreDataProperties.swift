//
//  CitiesData+CoreDataProperties.swift
//  Square One Task
//
//  Created by Karim Soliman on 04/09/2022.
//
//

import Foundation
import CoreData
import UIKit

extension CitiesData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CitiesData> {
        return NSFetchRequest<CitiesData>(entityName: "CitiesData")
    }

    @NSManaged public var citiesJosn: Data?

}

extension CitiesData : Identifiable {

}
