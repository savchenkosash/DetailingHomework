//
//  Car.swift
//  DetailingHomework
//
//  Created by alexander on 2.12.25.
//

import Foundation

struct Car: Codable {
    let name: String
    let className: String
    let year: String
    let color: String
    let mileage: String
    let power: String
    let topSpeed: String
    let number: String
    let owner: String
    
    static var mock: Car {
        Car(
            name: "Porsche 911",
            className: "Exclusive",
            year: "2017",
            color: "Red",
            mileage: "500",
            power: "250",
            topSpeed: "220",
            number: "AA002S",
            owner: "Tej"
        )
    }
}




