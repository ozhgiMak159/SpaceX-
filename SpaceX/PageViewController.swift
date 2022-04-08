//
//  PageViewController.swift
//  SpaceX
//
//  Created by Maksim  on 28.03.2022.
//



import UIKit

class PageViewController: UIPageViewController {
    

   private var newArray: [ListRockets] = []
    
   private let countries = [
        NSLocalizedString("Republic of the Marshall Islands", comment: ""),
        NSLocalizedString("United States", comment: ""),
        NSLocalizedString("United States", comment: ""),
        NSLocalizedString("United States", comment: "")
    ]

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
//        guard let imageData = NetworkManager.shered.fetchImage(from: newArray[index].flickrImages.first!) else { return nil }
//        DispatchQueue.global().async {
//            DispatchQueue.main.async {
//                mainVC.imageRocket.image = UIImage(data: imageData)
//            }
//        }
        
        mainVC.initNameRocket = newArray[index].name
        mainVC.initFirstLaunch = self.formatter.string(from: newArray[index].firstFlight)
        mainVC.initCountry = countries[index]
        mainVC.initLaunchCost = String(format: "$%.0f млн", newArray[index].costResult)
        mainVC.initHeight = String(newArray[index].height.feet)
        mainVC.initDiameter = String(newArray[index].diameter.feet)
        mainVC.initWeight = String(newArray[index].mass.lb)
        mainVC.initLoad = String(newArray[index].payloadWeights.first!.lb)
        mainVC.initNumberOfEnginesFirst = String(newArray[index].firstStage.engines)
        mainVC.initFuelQuantityFirst = String(newArray[index].firstStage.fuelAmountTons ?? 0)
        mainVC.initCombustionTimeFirst = String(newArray[index].firstStage.fuelAmountTons ?? 0)
        mainVC.initNumberOfEnginesSecond = String(newArray[index].secondStage.engines)
        mainVC.initFuelQuantitySecond = String(newArray[index].secondStage.fuelAmountTons ?? 0)
        mainVC.initComdustionTimeSecond = String(newArray[index].secondStage.burnTimeSec ?? 0)
        mainVC.indexOfNumber = index
        return mainVC
    }
        
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
