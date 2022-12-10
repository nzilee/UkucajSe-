//
//  ViewController.swift
//  UkucajSe
//
//  Created by Nikola Zivkovic on 11/30/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plateNumberInput: UITextField!
    @IBOutlet weak var cityPickerField: UITextField!
    var plateNumber = ""
    let cities = [
        gradNis,
        gradBeograd,
        gradNoviSad
    ]
    let cityNames = [
        "",
        gradNis.name,
        gradBeograd.name,
        gradNoviSad.name
    ]
    var cityPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plateNumberInput.textAlignment = .center
        plateNumberInput.selectedTextRange = nil
        
        cityPickerField.selectedTextRange = nil
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityPickerField.inputView = cityPickerView
        
    }
    
    func hideKeyboard() {
        plateNumberInput.resignFirstResponder()
    }
    
    @IBAction func Zona1ButtonPressed(_ sender: UIButton) {
        switch cityPickerField.text{
        case gradNis.name:
            let sms = "sms:\(gradNis.zone1.number)&body=\(plateNumber.uppercased())"
            let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
        case gradBeograd.name:
            let sms = "sms:\(gradBeograd.zone1.number)&body=\(plateNumber.uppercased())"
            let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
        case gradNoviSad.name:
            let sms = "sms:\(gradNoviSad.zone1.number)&body=\(plateNumber.uppercased())"
            let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
        default:
            cityPickerField.text = "Izaberite grad"
            cityPickerField.textColor = .white
            cityPickerField.backgroundColor = .red
        }
        print(plateNumber)
    }
    
//    @IBAction func zona2ButtonPressed(_ sender: UIButton) {
//        let sms = "sms:\(gradNis.zone2.number)&body=\(plateNumber.uppercased())"
//        let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//        UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
//        print(plateNumber)
//    }
//
//    @IBAction func zona3ButtonePressed(_ sender: UIButton) {
//        let sms = "sms:\(gradNis.zone3.number)&body=\(plateNumber.uppercased())"
//        let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//        UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
//        print(plateNumber)
//    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        plateNumber = String(plateNumberInput.text!)
        hideKeyboard()
    }
    
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityPickerField.text = cityNames[row]
        cityPickerField.resignFirstResponder()
    }
    
}
