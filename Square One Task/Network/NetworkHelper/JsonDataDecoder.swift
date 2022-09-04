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
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        return parsedData ?? CitiesDataModel() as! T
    }
}
