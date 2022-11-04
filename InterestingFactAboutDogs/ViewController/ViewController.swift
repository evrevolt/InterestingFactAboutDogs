//
//  ViewController.swift
//  InterestingFactAboutDogs
//
//  Created by Геннадий Ведерников on 04.11.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var factLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextFactButtonTapped() {
        
        
        guard let url = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let fact = try JSONDecoder().decode([InterestingFact].self, from: data)
                print(fact)
                DispatchQueue.main.async {
                    self.factLabel.text = fact.count.formatted()
                }
            } catch let error {
                print(error)
            }
        }.resume()
        
    }
    
}

