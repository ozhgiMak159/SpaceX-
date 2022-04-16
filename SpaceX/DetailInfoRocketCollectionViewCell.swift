//
//  DetailInfoRocketCollectionViewCell.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 21.03.2022.
//

import UIKit

class DetailInfoRocketCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet var nameRocket: UILabel!
    @IBOutlet var flightDate: UILabel!
    
    @IBOutlet var flightResultImage: UIImageView!
    
    // MARK: - Private property
    private let formatter = Formatters()
    
    // MARK: - Initialization of cell content
    func one(with data: RocketLaunches) {
        nameRocket.text = data.name
        flightDate.text = formatter.stringToDateVc(date: data.dateUtc)
        
        if let data = data.success {
            if data {
                flightResultImage.image = UIImage(named: "True")
            } else {
                flightResultImage.image = UIImage(named: "False")
            }
        } else {
            flightResultImage.image = UIImage(named: "True or False")
        }
    }
}


