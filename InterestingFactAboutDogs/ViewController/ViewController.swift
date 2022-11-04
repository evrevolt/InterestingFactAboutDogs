//
//  ViewController.swift
//  InterestingFactAboutDogs
//
//  Created by Геннадий Ведерников on 04.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var facts: [String] = []
    
    
    @IBOutlet var activiryIndicator: UIActivityIndicatorView!
    @IBOutlet var factLabel: UILabel!
    
    override func viewDidLoad() {
        
        //Скрываем лэйбл
        factLabel.isHidden = true
        super.viewDidLoad()
        //Загружаем данные
        fetchFactAboutDogs()
        
        //Настраиваем ромашку
        activiryIndicator.startAnimating()
        activiryIndicator.hidesWhenStopped = true
        DispatchQueue.main.async {
            self.showLabel()
        }
    }
    
    @IBAction func nextFactButtonTapped() {
        
        let result = facts.randomElement()
        factLabel.text = result
        
    }
    
    //Загружаем данные из сети
    private func fetchFactAboutDogs() {
        NetworkManager.shared.fetchFacts(url: Link.url.rawValue) { [unowned self] strings in
            self.facts = strings
        }
    }
    
    private func showLabel() {
        
        DispatchQueue.main.async {
            self.factLabel.text = self.facts.randomElement()
            self.factLabel.isHidden = false
            self.activiryIndicator.stopAnimating()
        }
        
    }
        
        
        
        
        //    func downloadFacts() {
        //        guard let url = URL(string: "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all") else { return }
        //        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
        //            guard let data = data else {
        //                print(error?.localizedDescription ?? "No error description")
        //                return
        //            }
        //
        //            do {
        //                let fact = try JSONDecoder().decode([InterestingFact].self, from: data)
        //                DispatchQueue.main.async {
        //
        //                    self?.factLabel.text = getStrings(from: fact).randomElement()
        //                    self?.activiryIndicator.stopAnimating()
        //                    self?.factLabel.isHidden = false
        //
        //                    self?.facts = fact
        //                }
        //            } catch let error {
        //                print(error)
        //            }
        //        }.resume()
        //    }
        
}

