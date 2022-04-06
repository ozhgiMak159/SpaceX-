//
//  PageViewController.swift
//  SpaceX
//
//  Created by Maksim  on 28.03.2022.
//



import UIKit

class PageViewController: UIPageViewController {
    

    private var newArray: [ListRockets] = []
    
    private let formatter: DateFormatter = {
            let dataForm = DateFormatter()
            dataForm.locale = .current
            dataForm.dateStyle = .long
            return dataForm }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shered.fetchData(dataType: [ListRockets].self, url: Link.listRocet.rawValue) { data in
            self.newArray = data
            self.pageViewControllerMethod()
        }
}
        
    private func pageViewControllerMethod() {
        guard let startingVc = detaliIndex(index: 0) else { return }
        setViewControllers([startingVc], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
  
    private func detaliIndex(index: Int) -> MainViewController? {
        guard index >= 0 else { return nil }
        guard index < self.newArray.count else { return nil }
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return nil }
        mainVC.initNameRocket = newArray[index].name
        mainVC.initFirstLaunch = self.formatter.string(from: newArray[index].first_flight)
        mainVC.initCountry = newArray[index].country
        mainVC.initLaunchCost = String(format: "$%.0f млн", newArray[index].cost_per_launch)
        mainVC.initHeight = String(newArray[index].height.feet)
        mainVC.initDiameter = String(newArray[index].diameter.feet)
        mainVC.initWeight = String(newArray[index].mass.lb)
        mainVC.initLoad =  String(newArray[index].payload_weights.last!.lb)
       //mainVc.launchCost.text = self.numberFormatter.string(from: NSNumber(value: self.newArray[index].cost_per_launch))
        mainVC.initNumberOfEnginesFirst = String(newArray[index].first_stage.engines)
        mainVC.initFuelQuantityFirst = String(newArray[index].first_stage.fuel_amount_tons ?? 0)
        mainVC.initCombustionTimeFirst = String(newArray[index].first_stage.fuel_amount_tons ?? 0)
        mainVC.initNumberOfEnginesSecond = String(newArray[index].second_stage.engines)
        mainVC.initFuelQuantitySecond = String(newArray[index].second_stage.fuel_amount_tons ?? 0)
        mainVC.initComdustionTimeSecond = String(newArray[index].second_stage.burn_time_sec ?? 0)
        mainVC.indexOfNumber = index
        
        return mainVC
    }
    
    
//    func add(_ index: Int) {
//        guard index >= 0 else { return }
//        guard index < self.newArray.count else { return }
//        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return }
//        mainVC.initNameRocket = newArray[index].name
//    }
    
    
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var mainVc = (viewController as! MainViewController).indexOfNumber
        mainVc -= 1
        
        return detaliIndex(index: mainVc)
}

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var mainVc = (viewController as! MainViewController).indexOfNumber
        mainVc += 1
        
        return detaliIndex(index: mainVc)
    }
    
}
