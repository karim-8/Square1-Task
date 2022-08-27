//
//  CitiesDataModel.swift
//  Square One Task
//
//  Created by Karim Soliman on 21/08/2022.
//

struct CitiesDataModel:Codable {
    var data: DataClass?
    var time: Int?
}

// DataClass.swift


// MARK: - DataClass
struct DataClass:Codable {
    var items: [Item]?
    var pagination: Pagination?
}

// Item.swift


// MARK: - Item
struct Item :Codable {
    var id: Int?
    var name, localName: String?
    var lat, lng: Double?
    var createdAt: CreatedAt?
    var updatedAt: String?
    var countryID: Int?
    var country: Country?
}



// MARK: - Country
struct Country {
    var id: Int?
    var name: Name?
    var code: Code?
    var createdAt, updatedAt: AtedAt?
    var continentID: Int?
}

// Code.swift


enum Code {
    case idn
    case ind
}

// AtedAt.swift


enum AtedAt {
    case the20180107170801
}

// Name.swift

enum Name {
    case india
    case indonesia
}

// CreatedAt.swift

import Foundation

enum CreatedAt {
    case the20180107170804
    case the20180107170805
}

// Pagination.swift


// MARK: - Pagination
struct Pagination :Codable{
    var currentPage, lastPage, perPage, total: Int?
}


//struct CitiesDataModel : Codable {
//    var data : DataClass?
//    var time : Int?
//}
//
//struct DataClass : Codable {
//    var items : [Items]?
//    var pagination : Pagination?
//}
//
//struct Items : Codable {
//    var id : Int?
//    var name : String?
//    var local_name : String?
//    var lat : Double?
//    var lng : Double?
//    var created_at : String?
//    var updated_at : String?
//    var country_id : Int?
//    var country : Country?
//}
//
//
//struct Country : Codable {
//    var id : Int?
//    var name : String?
//    var code : String?
//    var created_at : String?
//    var updated_at : String?
//    var continent_id : Int?
//
//}
//
//struct Pagination : Codable {
//    let current_page : Int?
//    let last_page : Int?
//    let per_page : Int?
//    let total : Int?
//
//}
