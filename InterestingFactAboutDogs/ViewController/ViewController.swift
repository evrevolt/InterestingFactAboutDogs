//
//  ViewController.swift
//  InterestingFactAboutDogs
//
//  Created by Геннадий Ведерников on 04.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var facts: [InterestingFact] = []
    
    
    @IBOutlet var activiryIndicator: UIActivityIndicatorView!
    @IBOutlet var factLabel: UILabel!
    
    override func viewDidLoad() {
        
        factLabel.isHidden = true
        super.viewDidLoad()
        activiryIndicator.startAnimating()
        activiryIndicator.hidesWhenStopped = true
        
        downloadFacts()
    }

    @IBAction func nextFactButtonTapped() {
        
        let result = getStrings(from: facts)
        factLabel.text = result.randomElement()
        
    }
    
    func downloadFacts() {
        guard let url = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let fact = try JSONDecoder().decode([InterestingFact].self, from: data)
                DispatchQueue.main.async {

                    self.factLabel.text = getStrings(from: fact).randomElement()
                    self.activiryIndicator.stopAnimating()
                    self.factLabel.isHidden = false
                    
                    self.facts = fact
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

