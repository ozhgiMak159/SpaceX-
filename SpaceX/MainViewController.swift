//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit


class MainViewController: UIViewController {
   
    
    
    var current = 0
    var number = 0
//    var one = UIPageViewController()
    
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
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   fetchData(Link.listRocet.rawValue)
//        one.dataSource = self
        
        
        
        
    }
    
    
    
// private func fetchData(_ url: String) {
//        NetworkManager.shered.fetchData(url) { list in
//            list.forEach { name in
//                self.nameRocket.text = name.name
//                self.country.text = name.country
//                self.launchCost.text = String(format: "%.0f", name.cost_per_launch)
//                self.numberOfEngines.text = String(name.first_stage.engines)
//                self.fuelQuantityFirst.text = String(format: "%.0f", name.first_stage.fuel_amount_tons ?? 0.0)
//                self.CombustionTimeFirst.text = String(name.first_stage.burn_time_sec ?? 0)
//                self.numberOfEnginesSecond.text = String(name.second_stage.engines)
//                self.fuelQuantitySecond.text = String(format: "%.0f", name.second_stage.fuel_amount_tons ?? 0.0)
//                self.comdustionTimeSecond.text = String(name.second_stage.burn_time_sec ?? 0)
//            }
//        }
//    }

    
    
//    private func fetchData(_ index: Int) {
//
//        NetworkManager.shered.fetchData(Link.listRocet.rawValue) { list in
//               list.forEach { name in
//                   guard index >= 0 else  { return }
//                   guard index < list.count else { return }
//                   self.nameRocket.text = list[index].name
//               }
//           }
//       }
    
 
}






