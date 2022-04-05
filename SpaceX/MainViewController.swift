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
   

    var currentIndex = 0
    var indexOfNumber = 0
    
    
   
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
        //configur()
        //pageControllerRocket.currentPage = currentIndex
    }
    
    
//    private func configur() {
//        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageVc") as? PageViewController else { return }
//        
//        self.addChild(pageViewController)
//        pageViewController.didMove(toParent: self)
//        
//        guard let startingVc = detaliIndex(index: 0) else { return }
//        view.addSubview(pageViewController.view)
//        pageViewController.setViewControllers([startingVc], direction: .forward, animated: true, completion: nil)
// 
//        let views: [String: Any] = ["pageView": pageViewController.view!]
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
//
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
//
//
//        pageViewController.delegate = self
//        pageViewController.dataSource = self
//
//    }

//    private func detaliIndex(index: Int) -> Self? {
//        NetworkManager.shered.fetchData(dataType: [ListRockets].self, url: Link.listRocet.rawValue) { data in
//            self.newArray = data
//            if index >= self.newArray.count || self.newArray.count == 0 { return }
//            self.nameRocket.text = self.newArray[index].name
//            self.currentIndex = self.newArray.count
//        }
//
//        self.indexOfNumber = index
//        return nil
//    }


    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let navigationVC = segue.destination as? UINavigationController else { return }
//        guard let settingsVc = navigationVC.topViewController as? SettingsViewController else { return }
//        settingsVc.newArray = self.newArray
//        settingsVc.delegate = self
//    }
    
}
extension MainViewController: UpData {

    func upp(text1: String, text2: String, text3: String, text4: String,text5: String) {
        unitOfHeight.text = text1
        unitOfDiameter.text = text2
        unitOfWeight.text = text3
        unitOfLoad.text = text4

        height.text = text5
    }
}
//extension MainViewController: UIPageViewControllerDelegate,UIPageViewControllerDataSource {
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
//
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return newArray.count
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        let vcOne = viewController as? MainViewController
//        guard var currentIndex = vcOne?.indexOfNumber else { return nil }
//        self.currentIndex = currentIndex
//
//        if currentIndex == 0 { return nil }
//        currentIndex -= 1
//        return detaliIndex(index: currentIndex)
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        let vcOne = viewController as? MainViewController
//        guard var currentIndex = vcOne?.indexOfNumber else { return nil }
//
//        if currentIndex == newArray.count { return nil }
//        currentIndex += 1
//        self.currentIndex = currentIndex
//        return detaliIndex(index: currentIndex)
//    }
//
//
//}







