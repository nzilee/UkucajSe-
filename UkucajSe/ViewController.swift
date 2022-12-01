//
//  ViewController.swift
//  UkucajSe
//
//  Created by Nikola Zivkovic on 11/30/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plateNumberInput: UITextField!
    var plateNumber = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func hideKeyboard() {
        plateNumberInput.resignFirstResponder()
    }
    
    
    
    @IBAction func Zona1ButtonPressed(_ sender: UIButton) {
        let smsZona1 = "sms:9181&body=\(plateNumber)"
        let strURL = smsZona1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
        print(plateNumber)
    }
    
    @IBAction func zona2ButtonPressed(_ sender: UIButton) {
        let smsZona2 = "sms:9182&body=\(plateNumber)"
        let strURL = smsZona2.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
        print(plateNumber)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        plateNumber = String(plateNumberInput.text!)
        hideKeyboard()
    }


}

