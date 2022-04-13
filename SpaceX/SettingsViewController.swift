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
    var number = 0
    
    var unitNumberHeight: String!
    var unitNumberDiameter: String!
    var unitNumberWeight: String!
    var unitNumberLoad: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statesSegmentIndex()
    }
    
    private func statesSegmentIndex() {
        segmentHeight.selectedSegmentIndex = 1
        segmentDiametr.selectedSegmentIndex = 1
        segmentLoad.selectedSegmentIndex = 1
//----------------------------------------------------------------------------------------------------------------------------------------
        unitNumberHeight = String((newArray[0].height?.feet)!) // старое значения поставить число из модели данных
        unitNumberDiameter = String((newArray[0].diameter?.feet)!)
        unitNumberWeight = String((newArray[0].mass?.kg)!)
        unitNumberLoad = String(newArray[0].payloadWeights[0].lb!)
    }
    
    private func add(index: Int, sender: UISegmentedControl) {
        
        switch sender.tag {
        case 1:
            unitHeight = segmentHeight.titleForSegment(at: segmentHeight.selectedSegmentIndex) ?? ""
            unitNumberHeight = String((newArray[index].height?.meters)!) // новое значения
        case 2:
            unitDiameter = segmentDiametr.titleForSegment(at: segmentDiametr.selectedSegmentIndex) ?? ""
            unitNumberDiameter = String((newArray[index].diameter?.meters)!)
        case 3:
            unitWeight = segmentMass.titleForSegment(at: segmentMass.selectedSegmentIndex) ?? ""
            unitNumberWeight = String((newArray[index].mass?.lb)!)
        default:
            unitLoad = segmentLoad.titleForSegment(at: segmentLoad.selectedSegmentIndex) ?? ""
            unitNumberLoad = String(newArray[index].payloadWeights[index].kg!)
        }
    
    }
    
    
    
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        add(index: 0, sender: sender)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        delegate.setSettingsUnits(unitHeight, unitDiameter, unitWeight, unitLoad)
        delegate.setSettingsNumberUnits(unitNumberHeight, unitNumberDiameter, unitNumberWeight, unitNumberLoad)
        dismiss(animated: true, completion: nil)
    }
    
}


