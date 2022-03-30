//
//  RocketLaunches.swift
//  SpaceX
//
//  Created by Maksim  on 24.03.2022.
//

import Foundation


struct RocketLaunches: Decodable {
    let name: String
    let success: Bool?
    var dateUtc: Date
        
    enum CodingKeys: String, CodingKey {
        case name
        case success
        case dateUtc = "date_utc"
    }
    
    
    
    
}




/*
 let dataForm = DateFormatter()
 dataForm.locale = Locale(identifier: "ru_RU")
 dataForm.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
 return dataForm.string(from: self)
 */
