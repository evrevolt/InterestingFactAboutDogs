//
//  NetworkManager.swift
//  InterestingFactAboutDogs
//
//  Created by Геннадий Ведерников on 04.11.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum Link: String {
    case url = "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchFacts(url: String, complition: @escaping([String]) -> Void ) {
        
        //Проверяем строку
        guard let url = URL(string: url) else { return }
        
        //Извлекаем данные (устанавливаем сессию)
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            //Декодируем
            do {
                let facts = try JSONDecoder().decode([FactAboutDogs].self, from: data)
                //Передаем данные через complition
                var strings = [String]()
                for fact in facts {
                    strings.append(fact.fact)
                }
                
                complition(strings)
                
                
            } catch {
                print(error)
            }
        }.resume()
    }
    private init() {}
}
