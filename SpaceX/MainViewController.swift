//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit


class MainViewController: UIViewController {
   

    var numberOfPage = 0
    var currentPage = 0
   
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
        pageControllerRocket.currentPage = numberOfPage
    }
    
    
    
    
    
    

 
}




/*
 class PageViewController: UIPageViewController {

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
             guard index >= 0 else { return   }
             guard index < data.count else { return  }
             mainVc.nameRocket.text = data[index].name
             
             mainVc.numberOfPage = index
             //mainVc.currentPage = data.count
             }
         
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
 */


