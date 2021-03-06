//
//  ViewController.swift
//  BitcoinPriceTracker
//
//  Created by Dilmurod Ubaydullaev on 12/28/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var eurLabel: UILabel!
    
    @IBOutlet weak var jpyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPrice()
    }
    
    func getPrice(){
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR"){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data{
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Double]{
                        DispatchQueue.main.async {
                            let formatter = NumberFormatter()
                            formatter.numberStyle = .currency
                            formatter.currencyCode = "USD"
                            
                            self.usdLabel.text = formatter.string(from: NSNumber(value: json["USD"]!))
                            
                            formatter.currencyCode = "EUR"
                            
                            self.eurLabel.text = formatter.string(from: NSNumber(value: json["EUR"]!))
                            
                            formatter.currencyCode = "JPY"
                            
                            self.jpyLabel.text = formatter.string(from: NSNumber(value: json["JPY"]!))
                        }
                    }
                }
                else{
                    print("Failed!")
                }
            }.resume()
        }
    }

    @IBAction func refreshTapped(_ sender: UIBarButtonItem) {
        getPrice()
    }
    
}

