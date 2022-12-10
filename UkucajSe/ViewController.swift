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
    @IBOutlet weak var zone1Button: UIButton!
    @IBOutlet weak var zone2Button: UIButton!
    @IBOutlet weak var zone3Button: UIButton!
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
    
    func sendSMS(with plateNum: String, to number: Int) {
        let sms = "sms:\(number)&body=\(plateNum.uppercased())"
        let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
    }
    
//    func pickerWarning() {
//        cityPickerField.backgroundColor = .red
//        cityPickerField.text = "Izaberite grad"
//    }
    
    @IBAction func cityIsChosen(_ sender: UITextField) {
        if cityPickerField.text == "" {
            cityPickerField.backgroundColor = .red
            cityPickerField.text = "Izaberite grad"
            zone1Button.isEnabled = false
            zone2Button.isEnabled = false
            zone3Button.isEnabled = false
        } else {
            cityPickerField.backgroundColor = .clear
            zone1Button.isEnabled = true
            zone2Button.isEnabled = true
            zone3Button.isEnabled = true
        }
    }
    
    @IBAction func zone1ButtonPressed(_ sender: UIButton) {
        switch cityPickerField.text{
        case gradNis.name:
            sendSMS(with: plateNumber, to: gradNis.zone1.number)
        case gradBeograd.name:
            sendSMS(with: plateNumber, to: gradBeograd.zone1.number)
        case gradNoviSad.name:
            sendSMS(with: plateNumber, to: gradNoviSad.zone1.number)
        default:
            cityPickerField.text = "Izaberite grad"
        }
        print(plateNumber)
    }
    
    @IBAction func zone2ButtonPressed(_ sender: UIButton) {
        switch cityPickerField.text{
        case gradNis.name:
            sendSMS(with: plateNumber, to: gradNis.zone2.number)
        case gradBeograd.name:
            sendSMS(with: plateNumber, to: gradBeograd.zone2.number)
        case gradNoviSad.name:
            sendSMS(with: plateNumber, to: gradNoviSad.zone2.number)
        default:
            cityPickerField.text = "Izaberite grad"
        }
        print(plateNumber)
    }

    @IBAction func zone3ButtonPressed(_ sender: UIButton) {
        switch cityPickerField.text{
        case gradNis.name:
            sendSMS(with: plateNumber, to: gradNis.zone3.number)
        case gradBeograd.name:
            sendSMS(with: plateNumber, to: gradBeograd.zone3.number)
        case gradNoviSad.name:
            sendSMS(with: plateNumber, to: gradNoviSad.zone3.number)
        default:
            cityPickerField.text = "Izaberite grad"
        }
        print(plateNumber)
    }
    
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
