//
//  Rockets.swift
//  SpaceX
//
//  Created by Maksim  on 24.03.2022.
//

import Foundation


struct ListRockets: Decodable {
    let height: Height 
    let diameter: Diameter
    let mass: Mass
    let payloadWeights: [PayloadWeights]
    let name: String
   // let country: String
    let firstFlight: Date
    let firstStage: First
    let secondStage: Second
    let costPerLaunch: Double
    let flickrImages: [String]
    
    var costResult: Double {
     return costPerLaunch / 1000000
    }
    
    enum CodingKeys: String, CodingKey {
        case height
        case diameter
        case mass
        case payloadWeights = "payload_weights"
        case name
       // case country
        case firstFlight = "first_flight"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case costPerLaunch = "cost_per_launch"
        case flickrImages = "flickr_images"
    }
}


struct Height: Decodable {
    let meters: Double
    let feet: Double
}


struct Diameter: Decodable {
    let meters: Double
    let feet: Double
}


struct Mass: Decodable {
    let kg: Double
    let lb: Double
}


struct PayloadWeights: Decodable {
    let kg: Double
    let lb: Double
}


struct First: Decodable {
    let engines: Int
    let fuelAmountTons: Double?
    let burnTimeSec: Int?
    
    
    enum CodingKeys: String, CodingKey {
       case engines
       case fuelAmountTons = "fuel_amount_tons"
       case burnTimeSec = "burn_time_sec"
    }
    
}


struct Second: Decodable {
    let engines: Int
    let fuelAmountTons: Double?
    let burnTimeSec: Int?
    
    
    enum CodingKeys: String, CodingKey {
       case engines
       case fuelAmountTons = "fuel_amount_tons"
       case burnTimeSec = "burn_time_sec"
    }
}


/*
 private let numberFormatter: NumberFormatter = {
     let number = NumberFormatter()
     number.numberStyle = .currency
     number.currencyGroupingSeparator = ""
     
     number.locale = .current
     number.maximumFractionDigits = 0
     
     return number
     
 }()
 */
