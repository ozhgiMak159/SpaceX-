//
//  SettingsViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 19.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet var segmentHeight: UISegmentedControl!
    @IBOutlet var segmentDiametr: UISegmentedControl!
    @IBOutlet var segmentMass: UISegmentedControl!
    @IBOutlet var segmentLoad: UISegmentedControl!
    
    var newArray: [ListRockets]!
    var delegate: UpDataSettingsDelegate!
    private var unitHeight = "ft"
    private var unitDiameter = "ft"
    private var unitWeight = "kg"
    private var unitLoad = "lb"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statesSegmentIndex()
    }
    
    private func statesSegmentIndex() {
        segmentHeight.selectedSegmentIndex = 1
        segmentDiametr.selectedSegmentIndex = 1
        segmentLoad.selectedSegmentIndex = 1
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.tag {
        case 1:
            unitHeight = segmentHeight.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
        case 2:
            unitDiameter = segmentDiametr.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
        case 3:
            unitWeight = segmentMass.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
        default:
            unitLoad = segmentLoad.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
        }
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        delegate.setSettingsUnits(unitHeight, unitDiameter, unitWeight, unitLoad)
        dismiss(animated: true, completion: nil)
    }
    
}

extension SettingsViewController {
    
}

