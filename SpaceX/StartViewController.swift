//
//  StartViewController.swift
//  SpaceX
//
//  Created by Maksim  on 05.04.2022.
//

//import UIKit
//
//class StartViewController: UIViewController {
//
//    
//    var newArray: [ListRockets] = []
//    var currentIndex = 0
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configur()
//      
//    }
//    
//    private func configur() {
//        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageVc") as? PageViewController else { return }
//        
//        self.addChild(pageViewController)
//        pageViewController.didMove(toParent: self)
//        
//        guard let startingVc = detaliIndex(index: 0) else { return }
//        
//        view.addSubview(pageViewController.view)
//        pageViewController.setViewControllers([startingVc], direction: .forward, animated: true, completion: nil)
//        
// 
//        let views: [String: Any] = ["pageView": pageViewController.view!]
//        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
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
//  
//    private func detaliIndex(index: Int) -> MainViewController? {
//        guard let dataVc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return nil }
//        NetworkManager.shered.fetchData(dataType: [ListRockets].self, url: Link.listRocet.rawValue) { data in
//            self.newArray = data
//            if index >= self.newArray.count || self.newArray.count == 0 { return }
//            dataVc.nameRocket.text = self.newArray[index].name
//            dataVc.currentIndex = self.newArray.count
//        }
//        dataVc.indexOfNumber = index
//
//        return dataVc
//    }
//    
//}
//extension StartViewController: UIPageViewControllerDelegate,UIPageViewControllerDataSource {
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
