//
//  DataFormatter.swift
//  SpaceX
//
//  Created by Maksim  on 11.04.2022.
//

import Foundation

class Formatter {
    
    func stringToDateVc(date: Date) -> String {
        var stringDate: String
        let dataForm = DateFormatter()
        dataForm.locale = .current
        dataForm.dateStyle = .long
        stringDate = dataForm.string(from: date)
        
        return stringDate
    }
}
