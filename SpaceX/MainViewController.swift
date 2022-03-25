//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit


class MainViewController: UIViewController {

    
    
    @IBOutlet var pageControllerRocket: UIPageControl!
    @IBOutlet var scrollViewMain: UIScrollView!
    
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
    
    var presentText = ""
    var currentPage = 0
    var numberOfPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  fetchData(url: Link.listRocet.rawValue)
        
        nameRocket.text = presentText
        pageControllerRocket.currentPage = currentPage
        pageControllerRocket.numberOfPages = numberOfPage
    }

    
// private func fetchData(url: String) {
//        NetworkManager.shered.fetchData(url) { roket in
//            roket.forEach { i in
//                self.nameRocket.text = i.name
//            }
//        }
//    }

    
    
    
    
    
    
    
    
}

