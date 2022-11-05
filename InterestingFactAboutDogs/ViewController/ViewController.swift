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
    }
    
    @IBAction func nextFactButtonTapped() {
        factLabel.text = facts.randomElement()
    }
    
    //Загружаем данные из сети
    private func fetchFactAboutDogs() {
        
        NetworkManager.shared.fetchFacts(url: Link.url.rawValue) { [weak self] result in
            switch result {
            case .success(let fact):
                self?.facts = fact
                
                DispatchQueue.main.async {
                    self?.factLabel.text = self?.facts.randomElement()
                    self?.factLabel.isHidden = false
                    self?.activiryIndicator.stopAnimating()
                }
                
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        
        
//        NetworkManager.shared.fetchFacts(url: Link.url.rawValue) { [unowned self] strings in
//            self.facts = strings
//
//            //Ждем загрузки данных
//            DispatchQueue.main.async {
//                self.factLabel.text = self.facts.randomElement()
//                self.factLabel.isHidden = false
//                self.activiryIndicator.stopAnimating()
//            }
//        }
    }
}

