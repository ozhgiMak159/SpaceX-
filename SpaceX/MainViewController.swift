//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit
protocol UpDataSettingsDelegate {
    func setSettings(_ height: String, _ diameter: String, _ weight: String, _ load: String )
}

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
    
    var newArrayMain: [ListRockets]!
    var currentOfNumber = 0
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
        pageControllerRocket.currentPage = currentOfNumber
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
//            settingsVc.one = unitOfHeight.text
//            settingsVc.two = unitOfDiameter.text
//            settingsVc.there = unitOfWeight.text
//            settingsVc.four = unitOfLoad.text
            settingsVc.delegate = self
        } else {
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let infoVc = navigationVC.topViewController as? InfoRocketLaunchCollectionViewController else { return }
            infoVc.title = nameRocket.text
        }
    }
}

extension MainViewController: UpDataSettingsDelegate {
    func setSettings(_ height: String, _ diameter: String, _ weight: String, _ load: String) {
        unitOfHeight.text = height
        unitOfDiameter.text = diameter
        unitOfWeight.text = weight
        unitOfLoad.text = load
    }
}


