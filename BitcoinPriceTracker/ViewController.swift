//
//  ViewController.swift
//  BitcoinPriceTracker
//
//  Created by Dilmurod Ubaydullaev on 12/28/19.
//  Copyright © 2019 Dilmurod Ubaydullaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getPrice(){
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR"){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data{
                    print("It worked!")
                }
                else{
                    print("Failed!")
                }
            }.resume()
        }
    }


}

