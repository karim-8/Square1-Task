//
//  JSONDecoder.swift
//  Square One Task
//
//  Created by Karim Soliman on 24/08/2022.
//

import Foundation

protocol JsonDecoderProtocol {
    func decodeJsonResult<T: Codable>(jsonData: Data, model: T) -> T
}

class JsonDataDecoder: JsonDecoderProtocol {
    
    //MARK:- DECODE JSON RESULT
    func decodeJsonResult<T: Codable>(jsonData: Data, model: T) -> T {
        var parsedData: T?
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        do {
             parsedData = try decoder.decode(T.self, from: jsonData)
        } catch {
            print("Unexpected error While parsing data: \(error).")
        }
        return parsedData ?? CitiesDataModel() as! T
    }
}
