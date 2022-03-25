//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit


class MainViewController: UIViewController {

    
    @IBOutlet var imageRocket: UIImageView!
    @IBOutlet var nameRocket: UILabel!
    
    
    
    @IBOutlet var firstLaunch: UILabel!
    @IBOutlet var country: UILabel!
    @IBOutlet var launchCost: UILabel!
    
    // первая ступень
    @IBOutlet var numberOfEngines: UILabel!
    @IBOutlet var fuelQuantityFirst: UILabel!
    @IBOutlet var CombustionTimeFirst: UILabel!
    
    
    @IBOutlet var numberOfEnginesSecond: UILabel!
    @IBOutlet var fuelQuantitySecond: UILabel!
    @IBOutlet var comdustionTimeSecond: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(url: Link.listRocet.rawValue)
    }

 private func fetchData(url: String) {
        NetworkManager.shered.fetchData(url) { roket in
           
        }
    }

}

