//
//  Cities.swift
//  UkucajSe
//
//  Created by Nikola Zivkovic on 12/9/22.
//

import UIKit

struct Zone {
    let number: Int
    let duration: Int
}

struct City {
    let name: String
    let zone1: Zone
    let zone2: Zone
    let zone3: Zone
}

let gradNis = City(name: "Nis",
                   zone1: .init(number: 9181, duration: 60),
                   zone2: .init(number: 9182, duration: 60),
                   zone3: .init(number: 9183, duration: 60))

let gradBeograd = City(name: "Beograd",
                       zone1: .init(number: 9111, duration: 60),
                       zone2: .init(number: 9112, duration: 60),
                       zone3: .init(number: 9183, duration: 60))

let gradNoviSad = City(name: "Novi Sad",
                       zone1: .init(number: 8211, duration: 60),
                       zone2: .init(number: 8212, duration: 60),
                       zone3: .init(number: 8210, duration: 60))

