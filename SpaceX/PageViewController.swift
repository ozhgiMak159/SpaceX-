//
//  PageViewController.swift
//  SpaceX
//
//  Created by Maksim  on 25.03.2022.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var rocket: ListRockets!
    var array = ["Falcon 1","Falcon 9","Starship","Falcone 10"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contentVCC = showViewControllerAtIndex(0) {
            setViewControllers([contentVCC], direction: .forward, animated: true, completion: nil)
        }

        
        dataSource = self
    }
    
    func showViewControllerAtIndex(_ index: Int) -> MainViewController? {
        guard index >= 0 else { return nil }
        guard index < array.count else { return nil }
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return nil }
        mainVC.presentText = array[index]
        mainVC.currentPage = index
        mainVC.numberOfPage = array.count
        
        return mainVC
    }
    
    
}
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! MainViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! MainViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}
