//
//  Rockets.swift
//  SpaceX
//
//  Created by Maksim  on 24.03.2022.
//

import Foundation


struct ListRockets: Decodable {
    let height: Height //(+)
    let diameter: Diameter //(+)
    let mass: Mass //(+)
    let payload_weights: [PayloadWeights] //(+)
    let name: String //(+)
    let country: String //(+)
    let first_flight: Date
    let first_stage: First //(+)
    let second_stage: Second //(+)
    let cost_per_launch: Double //(+)
    let flickr_images: [String]
    
    /*
     enum CodingKeys: String, CodingKey {
         case name
         case success
         case dateUtc = "date_utc"
     }
     */
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
    let fuel_amount_tons: Double?
    let burn_time_sec: Int?
}

struct Second: Decodable {
    let engines: Int
    let fuel_amount_tons: Double?
    let burn_time_sec: Int?
}


