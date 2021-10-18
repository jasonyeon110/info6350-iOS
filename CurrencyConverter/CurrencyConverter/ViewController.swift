//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Jason Yeon on 10/16/21.
//

import UIKit
import SwiftyJSON
import Alamofire
import SwiftSpinner


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let baseURL = "http://api.exchangeratesapi.io/v1/latest?"
    let apiKey = "access_key=549fa5f239976d1c3c10120e5c9012f7"
    var currencySymbolLists = ["AED","AFN","ALL","AMD","ANG","AOA","ARS","AUD","AWG","AZN","BAM","BBD","BDT","BGN","BHD","BIF","BMD","BND","BOB","BRL","BSD","BTC","BTN","BWP","BYN","BYR","BZD","CAD","CDF","CHF","CLF","CLP","CNY","COP","CRC","CUC","CUP","CVE","CZK","DJF","DKK","DOP","DZD","EGP","ERN","ETB","EUR","FJD","FKP","GBP","GEL","GGP","GHS","GIP","GMD","GNF","GTQ","GYD","HKD","HNL","HRK","HTG","HUF","IDR","ILS","IMP","INR","IQD","IRR","ISK","JEP","JMD","JOD","KES","KGS","KHR","KMF","KPW","KRW","KWD","KYD","KZT","LAK","LBP","LKR","LRD","LSL","LVL","LYD","MAD","MDL","MGA","MKD","MMK","MNT","MOP","MRO","MUR","MVR","MWK","MXN","MYR","MZN","NAD","NGN","NIO","NOK","NPR","NZD","OMR","PAB","PEN","PGK","PHP","PKR","PLN","PYG","QAR","RON","RSD","RUB","RWF","SAR","SBD","SCR","SDG","SEK","SGD","SHP","SLL","SOS","SRD","STD","SVC","SYP","SZL","THB","TJS","TMT","TND","TOP","TRY","TTD","TWD","TZS","UAH","UGX","USD","UYU","UZS","VEF","VND","VUV","WST","XAF","XAG","XCD","XDR","XOF","XPF","YER","ZAR","ZMK","ZMW","ZWL"]
    
    @IBOutlet weak var targetPicker: UIPickerView!
    
    @IBOutlet weak var baseCurrency: UITextField!
    
    @IBOutlet weak var lblOutputcurrency: UILabel!
    
    var targetLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetPicker.delegate = self
        targetPicker.dataSource = self
        
    }

    @IBAction func ConvertCurrencyButtonPressed(_ sender: Any) {
        
//        let baseCurrency: String = (txtBase.text?.uppercased())!
        let targetCurrency: String = targetLabel.uppercased()
        
        converCurrency( targetCurrency: targetCurrency)
    }
    
    func converCurrency(targetCurrency:String){
        
        let url = baseURL + apiKey
        
        SwiftSpinner.show("Converting Euro to \(targetCurrency)")
        
        print(url)
        
        AF.request(url).responseJSON { response in
            
            SwiftSpinner.hide()
            
            let allCurrenciesVals = JSON(response.data!)["rates"]
            
            let rate = allCurrenciesVals["\(self.targetLabel)"]
            
            self.lblOutputcurrency.text = "Euro to \(self.targetLabel) rate is \(rate)"
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencySymbolLists.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencySymbolLists[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let targetPicked = targetPicker.selectedRow(inComponent: 0)
        let target = currencySymbolLists[targetPicked]
        targetLabel = target
    }
    
    
}

