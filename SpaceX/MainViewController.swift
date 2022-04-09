//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit

//protocol UpData {
//    func upp(text1: String,
//             text2: String,
//             text3: String,
//             text4: String,
//             text5: String)
//}

class MainViewController: UIViewController {
   
        
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
   
    @IBOutlet var numberOfEnginesFirst: UILabel!
    @IBOutlet var fuelQuantityFirst: UILabel!
    @IBOutlet var combustionTimeFirst: UILabel!
    
    @IBOutlet var numberOfEnginesSecond: UILabel!
    @IBOutlet var fuelQuantitySecond: UILabel!
    @IBOutlet var comdustionTimeSecond: UILabel!
    
    var newArrayMain: [ListRockets] = []
    var indexOfNumber = 0
   // var initImage: UIImage!
    var initNameRocket = ""
    var initHeight = ""
    var initDiameter = ""
    var initWeight = ""
    var initLoad = ""
    var initFirstLaunch = ""
    var initCountry = ""
    var initLaunchCost = ""
    var initNumberOfEnginesFirst = ""
    var initFuelQuantityFirst = ""
    var initCombustionTimeFirst = ""
    var initNumberOfEnginesSecond = ""
    var initFuelQuantitySecond = ""
    var initComdustionTimeSecond = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControllerRocket.currentPage = indexOfNumber
        initTitle()
        firstStage()
        secondStage()
    }
    
    private func initTitle() {
        nameRocket.text = initNameRocket 
        height.text = initHeight
        diameter.text = initDiameter
        weight.text = initWeight
        load.text = initLoad
        firstLaunch.text = initFirstLaunch
        country.text = initCountry
        launchCost.text = initLaunchCost
    }
    
    private func firstStage() {
        numberOfEnginesFirst.text = initNumberOfEnginesFirst
        fuelQuantityFirst.text = initFuelQuantityFirst
        combustionTimeFirst.text = initCombustionTimeFirst
    }
    
    private func secondStage() {
        numberOfEnginesSecond.text = initNumberOfEnginesSecond
        fuelQuantitySecond.text = initFuelQuantitySecond
        comdustionTimeSecond.text = initComdustionTimeSecond
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SettingsVc" {
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let settingsVc = navigationVC.topViewController as? SettingsViewController else { return }
            settingsVc.newArray = newArrayMain
        } else {
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let infoVc = navigationVC.topViewController as? InfoRocketLaunchCollectionViewController else { return }
            infoVc.title = nameRocket.text
        }
    }
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let navigationVC = segue.destination as? UINavigationController else { return }
//            guard let settingsVc = navigationVC.topViewController as? SettingsViewController else { return }
//            settingsVc.newArray = newArrayMain
//           // settingsVc.delegate = self
//        }
   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let navigationVC = segue.destination as? UINavigationController else { return }
//        guard let infoVc = navigationVC.topViewController as? InfoRocketLaunchCollectionViewController else { return }
//        infoVc.title = nameRocket.text
//
//    }
    
    
}


