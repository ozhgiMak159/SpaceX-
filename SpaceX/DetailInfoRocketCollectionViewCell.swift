//
//  DetailInfoRocketCollectionViewCell.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 21.03.2022.
//

import UIKit

class DetailInfoRocketCollectionViewCell: UICollectionViewCell {
    
    
    private let formatter: DateFormatter = {
          let dataForm = DateFormatter()
          dataForm.locale = .current
          dataForm.dateStyle = .long
          return dataForm
      }()
    
    
    @IBOutlet var nameRocket: UILabel!
    @IBOutlet var flightDate: UILabel!
    @IBOutlet var flightResultImage: UIImageView!
    
    
    func one(with data: RocketLaunches) {
        
        nameRocket.text = data.name
        flightDate.text = formatter.string(from: data.dateUtc)
        
        if let data = data.success {
            if data {
                flightResultImage.image = UIImage(named: "True")
            } else {
                flightResultImage.image = UIImage(named: "False")
            }
        }
    }
}

