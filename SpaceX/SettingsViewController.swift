//
//  SettingsViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 19.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var segmentHeight: UISegmentedControl!
    @IBOutlet var segmentDiametr: UISegmentedControl!
    @IBOutlet var segmentMass: UISegmentedControl!
    @IBOutlet var segmentLoad: UISegmentedControl!
    
    // MARK: - Private properties
    var newArray: [ListRockets]!
    var delegate: UpDataSettingsDelegate!
    private var unitHeight = "ft"
    private var unitDiameter = "ft"
    private var unitWeight = "kg"
    private var unitLoad = "lb"
    
  
    // MARK: - UIViewController Method
    override func viewDidLoad() {
        super.viewDidLoad()
        statesSegmentIndex()
    }
   

    private func statesSegmentIndex() {
        segmentHeight.selectedSegmentIndex = 1
        segmentDiametr.selectedSegmentIndex = 1
        segmentLoad.selectedSegmentIndex = 1
    }
    
    // MARK: -Внимание: Методы по сохранению положение SegmentControl до конца не реализованы! Передача численных единиц измерения до конца не реализованы!
    private func dataInitializationSegmentControl(_ sender: UISegmentedControl) {
        switch sender.tag {
        case 1:
            unitHeight = segmentHeight.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
            UserDefaults.standard.set(unitHeight, forKey: Key.keyHeight.rawValue)
        case 2:
            unitDiameter = segmentDiametr.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
            UserDefaults.standard.set(unitDiameter, forKey: Key.keyDiameter.rawValue)
        case 3:
            unitWeight = segmentMass.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
            UserDefaults.standard.set(unitWeight, forKey: Key.keyWeight.rawValue)
        default:
            unitLoad = segmentLoad.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
            UserDefaults.standard.set(unitLoad, forKey: Key.keyLoad.rawValue)
        }
    }
    
    // MARK: - IBAction
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
          dataInitializationSegmentControl(sender)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        delegate.setSettingsUnits(unitHeight, unitDiameter, unitWeight, unitLoad)
        dismiss(animated: true, completion: nil)
    }
    
}

