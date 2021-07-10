//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    //MARK: - Properties,variable and data types
    
    let currencyArray = ["EUR","GBP","USD"]
   
    private var currency: CurrencyClass?
    private var bpi : Bpi?
    private var ViewModelVC : ViewModel!

    //MARK: - LifeCycle of ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewModelVC = ViewModel()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        self.getCurrencyValue()
    }

    //MARK: - API call to get data
    
    func getCurrencyValue(){
       
        self.ViewModelVC.getLiveCryptoValue { (response) in
            print(response)
            
            let responsedata = CurrencyClass.init(fromDictionary: response.rawValue as! [String : Any])
            self.currency = responsedata
            self.bitcoinPriceLabel.text = self.currency?.bpi?.eUR?.rate
        } failure: { (err) in
            print(err)
        }

    }
    


}

extension ViewController: UIPickerViewDataSource{
    //MARK: -  UIPickerView DataSource
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //number of currency count
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    //set currency on UIPickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
}

extension ViewController : UIPickerViewDelegate{
    //MARK: -  UIPickerView Delegate
    //on selection of picker set rate of bitcoin as per currency
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     //  var currencyName = ""
        
        //Set Value by using nested if let
        if currencyArray[row] == currency?.bpi?.eUR?.code{
        //    currencyName = currency?.bpi?.eUR?.code ?? ""
            self.bitcoinPriceLabel.text = currency?.bpi?.eUR?.rate
        }else if currencyArray[row] == currency?.bpi?.gBP?.code{
          //  currencyName = currency?.bpi?.gBP?.code ?? ""
            self.bitcoinPriceLabel.text = currency?.bpi?.gBP?.rate
        }else if  currencyArray[row] == currency?.bpi?.uSD?.code{
          //  currencyName = currency?.bpi?.uSD?.code ?? ""
            self.bitcoinPriceLabel.text = currency?.bpi?.uSD?.rate
        }
        
        //Set Value by using switch case
        
//        switch currencyName
//        {
//        case "EUR":
//            self.bitcoinPriceLabel.text = currency?.bpi?.eUR?.rate
//            break;
//        case "GBP":
//            self.bitcoinPriceLabel.text = currency?.bpi?.gBP?.rate
//            break;
//        case "USD":
//            self.bitcoinPriceLabel.text = currency?.bpi?.uSD?.rate
//            break;
//
//        default:
//            break;
//        }

       
    }

}
