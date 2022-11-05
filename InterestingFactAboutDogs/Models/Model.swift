//
//  Model.swift
//  InterestingFactAboutDogs
//
//  Created by Геннадий Ведерников on 04.11.2022.
//

import Foundation

struct FactAboutDogs: Decodable {
    let fact: String
    
    
    init(factData: [String: Any]) {
        fact = factData["fact"] as? String ?? ""
    }
    
    static func getFacts(from value: Any) -> [String] {
        guard let factsData = value as? [[String: Any]] else { return [] }
        var factAboutDogs: [String] = []
        for factData in factsData {
            let factDogs = FactAboutDogs(factData: factData)
            factAboutDogs.append(factDogs.fact)
        }
        return factAboutDogs
            
    }
    
}

