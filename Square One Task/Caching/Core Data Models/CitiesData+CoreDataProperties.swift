//
//  CitiesData+CoreDataProperties.swift
//  Square One Task
//
//  Created by Karim Soliman on 27/08/2022.
//
//

import Foundation
import CoreData


extension CitiesData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CitiesData> {
        return NSFetchRequest<CitiesData>(entityName: "CitiesData")
    }

    @NSManaged public var country: String?
    @NSManaged public var lat: Double
    @NSManaged public var lng: Double
    @NSManaged public var name: String?
    @NSManaged public var pagesNumber: Int16

}

extension CitiesData : Identifiable {

}
