//
//  Formatters.swift
//  SpaceX
//
//  Created by Maksim  on 11.04.2022.
//

import Foundation

class Formatters {

    func stringToDateVc(date: Date) -> String {
        var stringDate: String
        let dataForm = DateFormatter()
        dataForm.locale = .current
        dataForm.dateStyle = .long
        stringDate = dataForm.string(from: date)
        
        return stringDate
    }

    func numberFormatter(_ number: Double) -> String {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        if let result = format.string(from: number as NSNumber) { return result }
        
        return ""
    }
    
   
    func roundingNumbers(value: Double) -> String {
        String(format: "%.0f", value)
    }
    
}

enum StringOld: String  {
    case oldStringListRocket = "yyyy-MM-dd"
    case oldStringRocketLaunches = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
}


