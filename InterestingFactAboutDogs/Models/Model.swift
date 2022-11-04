//
//  Model.swift
//  InterestingFactAboutDogs
//
//  Created by Геннадий Ведерников on 04.11.2022.
//

import Foundation

struct FactAboutDogs: Decodable {
    let fact: String
}

struct Facts: Decodable {
    let facts: [FactAboutDogs]
    
}
