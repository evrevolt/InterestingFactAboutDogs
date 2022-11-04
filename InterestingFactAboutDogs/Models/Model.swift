//
//  Model.swift
//  InterestingFactAboutDogs
//
//  Created by Геннадий Ведерников on 04.11.2022.
//

import Foundation

struct InterestingFact: Decodable {
    let fact: String
}

struct Facts: Decodable {
    let facts: [InterestingFact]
    
    //Переведем один тип данных в другой тип данных
}

func getStrings(from: [InterestingFact]) -> [String] {
    var strings = [String]()
    for i in from {
        strings.append(i.fact)
    }
    return strings
}
