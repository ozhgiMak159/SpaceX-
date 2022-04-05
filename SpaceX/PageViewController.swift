//
//  PageViewController.swift
//  SpaceX
//
//  Created by Maksim  on 28.03.2022.
//



import UIKit

class PageViewController: UIPageViewController {
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
}
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

