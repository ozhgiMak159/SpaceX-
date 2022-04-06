//
//  PageViewController.swift
//  SpaceX
//
//  Created by Maksim  on 28.03.2022.
//



import UIKit

class PageViewController: UIPageViewController {
    

    private var newArray: [ListRockets] = []
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shered.fetchData(dataType: [ListRockets].self, url: Link.listRocet.rawValue) { data in
            self.newArray = data
            self.pageViewControllerMethod()
        }
      
    }
        
    private func pageViewControllerMethod() {
        guard let startingVc = detaliIndex(index: currentIndex) else { return }
        setViewControllers([startingVc], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
  
    private func detaliIndex(index: Int) -> MainViewController? {
        guard index >= 0 else { return nil }
        guard index < self.newArray.count else { return nil }
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return nil }
        mainVC.nameText = newArray[index].name
        
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

    
    
    
    
    

//
//     private var newArray: [ListRockets] = []
//
//     private let formatter: DateFormatter = {
//           let dataForm = DateFormatter()
//           dataForm.locale = .current
//           dataForm.dateStyle = .long
//           return dataForm
//       }()
//
//       private let numberFormatter: NumberFormatter = {
//          let numberForm = NumberFormatter()
//           numberForm.numberStyle = .currency
//           numberForm.minimum = 2
//           numberForm.currencyGroupingSeparator = ""
//           numberForm.locale = Locale(identifier: "en_US")
//           return numberForm
//       }()
//
//       override func viewDidLoad() {
//           super.viewDidLoad()
//           dataSource = self
//
//           if let new = add(0) {
//               setViewControllers([new],
//                                  direction: .forward,
//                                  animated: true,
//                                  completion: nil)
//           }
//       }
//
//       func add(_ index: Int) -> MainViewController?  {
//           guard let mainVc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return nil }
//
//           NetworkManager.shered.fetchData(dataType: [ListRockets].self, url: Link.listRocet.rawValue) { data in
//               self.newArray = data
//               guard index >= 0 else { return }
//               guard index < self.newArray.count else { return }
//               mainVc.nameRocket.text = self.newArray[index].name
//               mainVc.firstLaunch.text = self.formatter.string(from: self.newArray[index].first_flight)
//               mainVc.country.text = self.newArray[index].country
//               mainVc.height.text = String(self.newArray[index].height.feet)
//               mainVc.diameter.text = String(self.newArray[index].diameter.feet)
//               mainVc.weight.text = String(self.newArray[index].mass.lb)
//               mainVc.load.text =  String(self.newArray[index].payload_weights.last!.lb)
//               //mainVc.launchCost.text = self.numberFormatter.string(from: NSNumber(value: self.newArray[index].cost_per_launch))
//               mainVc.launchCost.text = String(format: "$%.0f млн", self.newArray[index].cost_per_launch)
//               mainVc.numberOfEngines.text = String(self.newArray[index].first_stage.engines)
//               mainVc.fuelQuantityFirst.text = String(self.newArray[index].first_stage.fuel_amount_tons ?? 0)
//               mainVc.CombustionTimeFirst.text = String(self.newArray[index].first_stage.fuel_amount_tons ?? 0)
//               mainVc.numberOfEnginesSecond.text = String(self.newArray[index].second_stage.engines)
//               mainVc.fuelQuantitySecond.text = String(self.newArray[index].second_stage.fuel_amount_tons ?? 0)
//               mainVc.CombustionTimeFirst.text = String(self.newArray[index].second_stage.burn_time_sec ?? 0)
//           }
//           mainVc.index = index
//           return mainVc
//
//       }
//

//   extension PageViewController: UIPageViewControllerDataSource {
//
//       func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//
//           var pageNumber = (viewController as! MainViewController).index
//           pageNumber -= 1
//           return add(pageNumber)
//       }
//
//       func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//
//           var pageNumber = (viewController as! MainViewController).index
//           pageNumber += 1
//           return add(pageNumber)
//       }
//}
//
//

/*
 func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
     let vcOne = viewController as? MainViewController
     guard var currentIndex = vcOne?.indexOfNumber else { return nil }
     self.currentIndex = currentIndex

     if currentIndex == 0 { return nil }
     currentIndex -= 1
     return detaliIndex(index: currentIndex)
 }

 func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
     let vcOne = viewController as? MainViewController
     guard var currentIndex = vcOne?.indexOfNumber else { return nil }

     if currentIndex == newArray.count { return nil }
     currentIndex += 1
     self.currentIndex = currentIndex
     return detaliIndex(index: currentIndex)
 }

 
 
 
 
 
 NetworkManager.shered.fetchData(dataType: [ListRockets].self, url: Link.listRocet.rawValue) { data in
     self.newArray = data
     if index >= self.newArray.count || self.newArray.count == 0 { return }
     mainVC.nameRocket.text = self.newArray[index].name
     mainVC.country.text = self.newArray[index].country
     mainVC.height.text = String(self.newArray[index].height.feet)
     mainVC.diameter.text = String(self.newArray[index].diameter.feet)
     mainVC.weight.text = String(self.newArray[index].mass.lb)
     mainVC.load.text =  String(self.newArray[index].payload_weights.last!.lb)
     mainVC.launchCost.text = String(format: "$%.0f млн", self.newArray[index].cost_per_launch)
     mainVC.numberOfEngines.text = String(self.newArray[index].first_stage.engines)
     mainVC.fuelQuantityFirst.text = String(self.newArray[index].first_stage.fuel_amount_tons ?? 0)
     mainVC.CombustionTimeFirst.text = String(self.newArray[index].first_stage.fuel_amount_tons ?? 0)
     mainVC.numberOfEnginesSecond.text = String(self.newArray[index].second_stage.engines)
     mainVC.fuelQuantitySecond.text = String(self.newArray[index].second_stage.fuel_amount_tons ?? 0)
     mainVC.CombustionTimeFirst.text = String(self.newArray[index].second_stage.burn_time_sec ?? 0)
     mainVC.countArray = self.newArray.count
 }

}
 */
