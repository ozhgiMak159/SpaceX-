//
//  PageViewController.swift
//  SpaceX
//
//  Created by Maksim  on 28.03.2022.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let arr = add(0) {
            setViewControllers([arr],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    

    func add(_ index: Int) -> MainViewController? {
        guard let mainVc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return nil }
        NetworkManager.shered.fetchData(Link.listRocet.rawValue) { data in
            guard index >= 0 else { return }
            guard index < data.count else {return }
            mainVc.nameRocket.text = data[index].name
            mainVc.number = index
            mainVc.current = data.count
        }
        return mainVc
    }
    
}
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! MainViewController).number
        pageNumber -= 1
        return add(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! MainViewController).number
        pageNumber += 1
        return add(pageNumber)
    }
    
    
}
