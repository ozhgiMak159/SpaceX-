//
//  PageViewController.swift
//  SpaceX
//
//  Created by Maksim  on 28.03.2022.
//



import UIKit

class PageViewController: UIPageViewController {
     
    // MARK: - Private properties
    private var formatter = Formatter()
    private var newArray: [ListRockets] = []
    private let countries = [
        NSLocalizedString("Republic of the Marshall Islands", comment: ""),
        NSLocalizedString("United States", comment: ""),
        NSLocalizedString("United States", comment: ""),
        NSLocalizedString("United States", comment: "")
    ]
    
    // MARK: - UIPageViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shered.fetchData(url: Link.listRocet.rawValue) { data in
            self.newArray = data
            self.pageViewControllerMethod()
        }
    }
    
    private func pageViewControllerMethod() {
        guard let startingVc = detaliIndex(index: 0) else { return }
        setViewControllers([startingVc], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
    
    // Init
    private func detaliIndex(index: Int) -> MainViewController? {
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainViewController else { return nil }
        guard index >= 0 else { return nil }
        guard index < self.newArray.count else { return nil }
        guard let imageData = NetworkManager.shered.fetchImage(from: newArray[index].randomElementImage) else { return nil }
        DispatchQueue.main.async { mainVC.imageRocket.image = UIImage(data: imageData) }
        mainVC.initNameRocket = newArray[index].name ?? "Error: No name"
        mainVC.initFirstLaunch = formatter.stringToDateVc(date: newArray[index].firstFlight)
        mainVC.initCountry = countries[index]
        mainVC.initLaunchCost = newArray[index].costResult
        mainVC.initHeight = String(newArray[index].height?.feet ?? 0.0)
        mainVC.initDiameter = String(newArray[index].diameter?.feet ?? 0.0)
        mainVC.initWeight = String(newArray[index].mass?.kg ?? 0.0)
        mainVC.initLoad = String(newArray[index].payloadWeights?.first?.lb ?? 0.0)
        mainVC.initNumberOfEnginesFirst = String(newArray[index].firstStage?.engines ?? 0)
        mainVC.initFuelQuantityFirst = String(newArray[index].firstStage?.fuelAmountTons ?? 0.0)
        mainVC.initCombustionTimeFirst = String(newArray[index].firstStage?.fuelAmountTons ?? 0.0)
        mainVC.initNumberOfEnginesSecond = String(newArray[index].secondStage?.engines ?? 0)
        mainVC.initFuelQuantitySecond = String(newArray[index].secondStage?.fuelAmountTons ?? 0.0)
        mainVC.initComdustionTimeSecond = String(newArray[index].secondStage?.burnTimeSec ?? 0)
        mainVC.currentOfNumber = index
        
        return mainVC
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVc = segue.destination as? MainViewController else { return }
        mainVc.newArrayMain = self.newArray
    }
}

    // MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var mainVc = (viewController as! MainViewController).currentOfNumber
        mainVc -= 1
        
        return detaliIndex(index: mainVc)
}

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var mainVc = (viewController as! MainViewController).currentOfNumber
        mainVc += 1
        
        return detaliIndex(index: mainVc)
    }
}
