//
//  ViewController.swift
//  InterestingFactAboutDogs
//
//  Created by Геннадий Ведерников on 04.11.2022.
//

import UIKit

class FactViewController: UIViewController {
    
    //Аутлеты
    @IBOutlet var activiryIndicator: UIActivityIndicatorView!
    @IBOutlet var factLabel: UILabel!
    
    //Приватные свойства
    private var facts: [String] = []
    
    override func viewDidLoad() {
        
        factLabel.isHidden = true
        super.viewDidLoad()
        fetchFactAboutDogs()
        
        activiryIndicator.startAnimating()
        activiryIndicator.hidesWhenStopped = true
    }
    
    @IBAction func nextFactButtonTapped() {
        factLabel.text = facts.randomElement()
    }
    
// MARK: - Download Data
    private func fetchFactAboutDogs() {
        
        NetworkManager.shared.fetchFacts(url: Link.url.rawValue) { [weak self] result in
            switch result {
            case .success(let fact):
                self?.facts = fact
                self?.factLabel.text = self?.facts.randomElement()
                self?.factLabel.isHidden = false
                self?.activiryIndicator.stopAnimating()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

