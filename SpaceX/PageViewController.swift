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
          dataForm.locale = Locale(identifier: "ru_RU")
          dataForm.dateFormat = "yyyy-MM-dd"
          return dataForm
      }()
      
      
      
      
      
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
      
      func add(_ index: Int) -> MainViewController? {
        
      
          
          
          guard let mainVc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else {return nil}
          NetworkManager.shered.fetchData(Link.listRocet.rawValue) { data in
              guard index >= 0 else { return }
              guard index < data.count else { return }
              mainVc.nameRocket.text = data[index].name
            //  mainVc.firstLaunch.text = self.formatter.string(for: data[index].first_flight)
              mainVc.country.text = data[index].country
              mainVc.launchCost.text = String(format: "%.0f", data[index].cost_per_launch)
              mainVc.numberOfEngines.text = String(data[index].first_stage.engines)
              mainVc.fuelQuantityFirst.text = String(data[index].first_stage.fuel_amount_tons ?? 0)
              mainVc.CombustionTimeFirst.text = String(data[index].first_stage.fuel_amount_tons ?? 0)
              mainVc.numberOfEnginesSecond.text = String(data[index].second_stage.engines)
              mainVc.fuelQuantitySecond.text = String(data[index].second_stage.fuel_amount_tons ?? 0)
              mainVc.CombustionTimeFirst.text = String(data[index].second_stage.burn_time_sec ?? 0)
              
            //  mainVc.imageRocket = data[index].flickr_images.count
            
              
              // data[index].first_flight
              
              
              
              
              
              
              
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

 

 
 
 @IBOutlet var numberOfEnginesSecond: UILabel!
 @IBOutlet var fuelQuantitySecond: UILabel!
 @IBOutlet var comdustionTimeSecond: UILabel!
 */
