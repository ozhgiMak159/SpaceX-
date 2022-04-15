//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit
protocol UpDataSettingsDelegate {
    func setSettingsUnits(_ UnitHeight: String, _ UnitDiameter: String, _ UnitWeight: String, _ UnitLoad: String )
}

class MainViewController: UIViewController {
   
    // MARK: - IBOutlets
    @IBOutlet var pageControllerRocket: UIPageControl!
    @IBOutlet var scrollViewMain: UIScrollView!

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
    @IBOutlet var combustionTimeSecond: UILabel!
    
    // MARK: - Public properties
    var newArrayMain: [ListRockets]!
    var currentOfNumber = 0
    var initImage: UIImage!
    var initNameRocket: String!
    var initHeight: String!
    var initDiameter: String!
    var initWeight: String!
    var initLoad: String!
    var initFirstLaunch: String!
    var initCountry: String!
    var initLaunchCost: String!
    var initNumberOfEnginesFirst: String!
    var initFuelQuantityFirst: String!
    var initCombustionTimeFirst: String!
    var initNumberOfEnginesSecond: String!
    var initFuelQuantitySecond: String!
    var initCombustionTimeSecond: String!
    
    // MARK: - UIViewController Method
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControllerRocket.currentPage = currentOfNumber
        initTitle()
        firstStage()
        secondStage()
        startPresentUnit()
        saveUnit()
    }
    
    private func saveUnit() {
        
        guard let heightKey = UserDefaults.standard.string(forKey: Key.keyHeight.rawValue) else { return }
        unitOfHeight.text = heightKey
        UserDefaults.standard.removeObject(forKey: Key.keyHeight.rawValue)
        
        guard let weightKey = UserDefaults.standard.string(forKey: Key.keyDiameter.rawValue) else { return }
        unitOfDiameter.text = weightKey
        UserDefaults.standard.removeObject(forKey: Key.keyDiameter.rawValue)

        guard let diameterKey = UserDefaults.standard.string(forKey: Key.keyWeight.rawValue) else { return }
        unitOfWeight.text = diameterKey
        UserDefaults.standard.removeObject(forKey: Key.keyWeight.rawValue)

        guard let loadKey = UserDefaults.standard.string(forKey: Key.keyLoad.rawValue) else { return }
        unitOfLoad.text = loadKey
        UserDefaults.standard.removeObject(forKey: Key.keyLoad.rawValue)
        
    }
    
    private func startPresentUnit() {
        unitOfHeight.text = "ft"
        unitOfWeight.text = "kg"
        unitOfDiameter.text = "ft"
        unitOfLoad.text = "lb"
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
        combustionTimeSecond.text = initCombustionTimeSecond
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SettingsVc" {
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let settingsVc = navigationVC.topViewController as? SettingsViewController else { return }
            settingsVc.newArray = newArrayMain
            settingsVc.delegate = self
        } else {
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let infoVc = navigationVC.topViewController as? InfoRocketLaunchCollectionViewController else { return }
            infoVc.title = nameRocket.text
        }
    }
}
// MARK: - Protocol Delegate. Прием и отображения численных единиц измерения до конца не реализованы.
extension MainViewController: UpDataSettingsDelegate {
    func setSettingsUnits(_ height: String, _ diameter: String, _ weight: String, _ load: String) {
        unitOfHeight.text = height
        unitOfDiameter.text = diameter
        unitOfWeight.text = weight
        unitOfLoad.text = load
    }
}


