//
//  ViewController.swift
//  RestAPI
//
//  Created by Jason Yeon on 9/30/21.
//

import UIKit
import SwiftSpinner
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    let baseURL = ""
    let apiKey = ""
    
    @IBOutlet weak var txtStock: UITextField!
    
    
    @IBOutlet weak var lblStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockValue(_ sender: Any) {
        
        if lblStock.text == "" {
            return;
        }
        
        let url = baseURL + txtStock.text! + "?apikey=" + apiKey;
        
        SwiftSpinner.show("Getting the stock price")
        
        AF.request(url).responseJSON {
            response in
            
            SwiftSpinner.hide()
            
            if response.error != nil {
                print(response.error!)
                return
            }
            
            print(response.data)
            let stocks = JSON(response.data!).array
            
            if stocks.isEmpty == true {
                print("Stock Symbol was incorrect")
                return
            }
            let firstStock = stocks[0]
            
            
        }
        
    }
    
}

