//
//  DataFormatter.swift
//  SpaceX
//
//  Created by Maksim  on 11.04.2022.
//

import Foundation

class Formatters {
    // MARK: - Date Formatter
    func stringToDateVc(date: Date) -> String {
        var stringDate: String
        let dataForm = DateFormatter()
        dataForm.locale = .current
        dataForm.dateStyle = .long
        stringDate = dataForm.string(from: date)
        
        return stringDate
    }
    // MARK: - NumberFormatter
    func numberFormatter(_ number: Double) -> String {
        let formatt = NumberFormatter()
        formatt.numberStyle = .decimal
        if let result = formatt.string(from: number as NSNumber) { return result }
        
        return ""
    }
}
// MARK: -
