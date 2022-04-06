//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit

protocol UpData {
    func upp(text1: String,
             text2: String,
             text3: String,
             text4: String,
             text5: String)
}

class MainViewController: UIViewController {
   

    var indexOfNumber = 0
    var countArray = 0
   
    var nameText = ""
    
    
   
    @IBOutlet var pageControllerRocket: UIPageControl!
    @IBOutlet var scrollViewMain: UIScrollView!
    @IBOutlet var mainView: UIView!
    
    
    @IBOutlet var imageRocket: UIImageView!
    @IBOutlet var nameRocket: UILabel!
   
    
    @IBOutlet var height: UILabel!
    @IBOutlet var unitOfHeight: UILabel!
    
    @IBOutlet var diameter: UILabel!
    @IBOutlet var unitOfDiameter: UILabel!
    
    @IBOutlet var weight: UILabel!
    @IBOutlet var unitOfWeight: UILabel!
    
    @IBOutlet var load: UILabel!
    @IBOutlet var unitOfLoad: UILabel!
    
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
        pageControllerRocket.currentPage = indexOfNumber
        initName()
    }
    
    
    private func initName() {
        nameRocket.text = nameText
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let navigationVC = segue.destination as? UINavigationController else { return }
//        guard let settingsVc = navigationVC.topViewController as? SettingsViewController else { return }
//        settingsVc.newArray = self.newArray
//        settingsVc.delegate = self
//    }
    
}







