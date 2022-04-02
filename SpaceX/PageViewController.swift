//
//  PageViewController.swift
//  SpaceX
//
//  Created by Maksim  on 28.03.2022.
//



 import UIKit

   class PageViewController: UIPageViewController {


       let formatter: DateFormatter = {
           let dataForm = DateFormatter()
           dataForm.locale = .current
           dataForm.dateStyle = .long
           return dataForm
       }()
       
       

//
//       func one(with data: RocketLaunches) {
//
//           nameRocket.text = data.name
//           flightDate.text = formatter.string(from: data.dateUtc)
//

       var newArray = [ListRockets]()
    
       override func viewDidLoad() {
           super.viewDidLoad()
           dataSource = self

           if let new = add(0) {
               setViewControllers([new],
                                  direction: .forward,
                                  animated: true,
                                  completion: nil)
           }
       }
       
       func add(_ index: Int) -> MainViewController?  {
           guard let mainVc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else {return nil}
           NetworkManager.shered.fetchData(Link.listRocet.rawValue) { data in
               self.newArray = data
               guard index >= 0 else { return  }
               guard index < self.newArray.count else { return  }
               mainVc.nameRocket.text = self.newArray[index].name
               mainVc.firstLaunch.text = self.formatter.string(from: self.newArray[index].first_flight)
               mainVc.country.text = self.newArray[index].country
               mainVc.launchCost.text = String(format: "%.0f", self.newArray[index].cost_per_launch)
               mainVc.numberOfEngines.text = String(self.newArray[index].first_stage.engines)
               mainVc.fuelQuantityFirst.text = String(self.newArray[index].first_stage.fuel_amount_tons ?? 0)
               mainVc.CombustionTimeFirst.text = String(self.newArray[index].first_stage.fuel_amount_tons ?? 0)
               mainVc.numberOfEnginesSecond.text = String(self.newArray[index].second_stage.engines)
               mainVc.fuelQuantitySecond.text = String(self.newArray[index].second_stage.fuel_amount_tons ?? 0)
               mainVc.CombustionTimeFirst.text = String(self.newArray[index].second_stage.burn_time_sec ?? 0)
           }
           mainVc.numberOfPage = index
           return mainVc
       }
  

       
       
   }
   extension PageViewController: UIPageViewControllerDataSource {
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
                    
           var pageNumber = (viewController as! MainViewController).numberOfPage
           pageNumber -= 1

           return add(pageNumber)
       }
       
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           
           var pageNumber = (viewController as! MainViewController).numberOfPage
           pageNumber += 1
           
           return add(pageNumber)
       }
       
       
   }




/*
 import UIKit

   class PageViewController: UIPageViewController {


       let formatter: DateFormatter = {
           let dataForm = DateFormatter()
           dataForm.locale = Locale(identifier: "ru_RU")
           dataForm.dateFormat = "yyyy-MM-dd"
           return dataForm
       }()
       
       var newArray = [ListRockets]()
    
       override func viewDidLoad() {
           super.viewDidLoad()
           dataSource = self
           
               if let fisrtVc = add(0) {
                   setViewControllers([fisrtVc],
                                       direction: .forward,
                                       animated: false,
                                       completion: nil)
               }
         
       }
       
       func add()  {
           
           guard let mainVc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else {return nil}
           guard let first = newArray.first else { return }
           
           NetworkManager.shered.fetchData(Link.listRocet.rawValue) { data in
               self.newArray = data
               mainVc.nameRocket.text = self.newArray[index].name
             //  mainVc.firstLaunch.text = self.formatter.string(for: data[index].first_flight)
               mainVc.country.text = self.newArray[index].country
               mainVc.launchCost.text = String(format: "%.0f", self.newArray[index].cost_per_launch)
               mainVc.numberOfEngines.text = String(self.newArray[index].first_stage.engines)
               mainVc.fuelQuantityFirst.text = String(self.newArray[index].first_stage.fuel_amount_tons ?? 0)
               mainVc.CombustionTimeFirst.text = String(self.newArray[index].first_stage.fuel_amount_tons ?? 0)
               mainVc.numberOfEnginesSecond.text = String(self.newArray[index].second_stage.engines)
               mainVc.fuelQuantitySecond.text = String(self.newArray[index].second_stage.fuel_amount_tons ?? 0)
               mainVc.CombustionTimeFirst.text = String(self.newArray[index].second_stage.burn_time_sec ?? 0)
               }
           mainVc.numberOfPage = index
       
           return mainVc
       }
       
       
       
   }
   extension PageViewController: UIPageViewControllerDataSource {
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
                    
//           var pageNumber = (viewController as! MainViewController).numberOfPage
//           pageNumber -= 1
//
//           return add(pageNumber)
       }
       
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           
           var pageNumber = (viewController as! MainViewController).numberOfPage
           pageNumber += 1
           
           return add(pageNumber)
       }
       
       
   }

 */
