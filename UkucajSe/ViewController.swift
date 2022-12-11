//
//  ViewController.swift
//  UkucajSe
//
//  Created by Nikola Zivkovic on 11/30/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var plateNumberInput: UITextField!
    @IBOutlet weak var cityPickerField: UITextField!
    @IBOutlet weak var zone1Button: UIButton!
    @IBOutlet weak var zone2Button: UIButton!
    @IBOutlet weak var zone3Button: UIButton!
    var didChooseCity: Bool = false
    var didInputRegistration: Bool = false
    var isPlateNumberFormatted = false
    var chosenCity: City?
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
        plateNumberInput.delegate = self
        plateNumberInput.textAlignment = .center
        plateNumberInput.selectedTextRange = nil
        
        cityPickerField.selectedTextRange = nil
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityPickerField.inputView = cityPickerView
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        plateNumberInput.resignFirstResponder()
        return true
    }
    
    func plateNumberFormatted() -> String {
        var plateNumberFormatted = plateNumber
        
        if isPlateNumberFormatted == false {
            let plateNumberThirdIndex = plateNumberFormatted.index(plateNumberFormatted.startIndex, offsetBy: 2)
            let plateNumberThirdToLastIndex = plateNumberFormatted.index(plateNumberFormatted.endIndex, offsetBy: -1)

            plateNumberFormatted.insert("-", at: plateNumberThirdIndex)
            plateNumberFormatted.insert("-", at: plateNumberThirdToLastIndex)
            
            isPlateNumberFormatted = true
        }
        return plateNumberFormatted.uppercased()
    }
    
    func sendSMS(with plateNum: String, to number: Int) {
        let sms = "sms:\(number)&body=\(plateNum.uppercased())"
        let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
    }
    
    func pickerFieldAndButtonsAreDefault() {
        cityPickerField.backgroundColor = .clear
        zone1Button.isEnabled = true
        zone2Button.isEnabled = true
        zone3Button.isEnabled = true
    }
    
    @IBAction func cityIsChosen(_ sender: UITextField) {
        switch cityPickerField.text{
        case gradNis.name:
            chosenCity = gradNis
            didChooseCity = true
            pickerFieldAndButtonsAreDefault()
        case gradBeograd.name:
            chosenCity = gradBeograd
            didChooseCity = true
            pickerFieldAndButtonsAreDefault()
        case gradNoviSad.name:
            chosenCity = gradNoviSad
            didChooseCity = true
            pickerFieldAndButtonsAreDefault()
        case "":
            chosenCity = nil
            cityPickerField.backgroundColor = .red
            cityPickerField.text = "Izaberite grad"
            zone1Button.isEnabled = false
            zone2Button.isEnabled = false
            zone3Button.isEnabled = false
            didChooseCity = false
        default:
            cityPickerField.text = "Izaberite grad"
        }
    }
    
    @IBAction func zone1ButtonPressed(_ sender: UIButton) {
        sendSMS(with: plateNumber, to: chosenCity!.zone1.number)
        print(plateNumber)
    }
    
    @IBAction func zone2ButtonPressed(_ sender: UIButton) {
        sendSMS(with: plateNumber, to: chosenCity!.zone2.number)
        print(plateNumber)
    }

    @IBAction func zone3ButtonPressed(_ sender: UIButton) {
        sendSMS(with: plateNumber, to: chosenCity!.zone3.number)
        print(plateNumber)
    }
    
    @IBAction func plateNumberInputEnded(_ sender: UITextField) {
        plateNumber = String(plateNumberInput.text!)
        didInputRegistration = true
        plateNumberInput.text = plateNumberFormatted()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        plateNumber = String(plateNumberInput.text!)
        plateNumberInput.resignFirstResponder()
        didInputRegistration = true
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
