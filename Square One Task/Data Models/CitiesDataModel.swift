//
//  CitiesDataModel.swift
//  Square One Task
//
//  Created by Karim Soliman on 21/08/2022.
//

struct CitiesDataModel : Codable {
    var data : DataClass?
    var time : Int?
}

struct DataClass : Codable {
    var items : [Items]?
    var pagination : Pagination?
}

struct Items : Codable {
    var id : Int?
    var name : String?
    var local_name : String?
    var lat : Double?
    var lng : Double?
    var created_at : String?
    var updated_at : String?
    var country_id : Int?
    var country : Country?
}


struct Country : Codable {
    var id : Int?
    var name : String?
    var code : String?
    var created_at : String?
    var updated_at : String?
    var continent_id : Int?

}

struct Pagination : Codable {
    let current_page : Int?
    let last_page : Int?
    let per_page : Int?
    let total : Int?

}
