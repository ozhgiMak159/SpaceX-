//
//  DetailInfoRocketCollectionViewCell.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 21.03.2022.
//

import UIKit

class DetailInfoRocketCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var nameRocket: UILabel!
    @IBOutlet var flightDate: UILabel!
    @IBOutlet var flightResultImage: UIImageView!
    
    
    func one(with data: RocketLaunches) {
        nameRocket.text = data.name
        flightDate.text = data.date_utc
    }
    
    
    
    
}
