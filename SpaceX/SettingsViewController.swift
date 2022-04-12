//
//  SettingsViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 19.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet var segmentHiegh: UISegmentedControl!
    @IBOutlet var segmentDiametr: UISegmentedControl!
    @IBOutlet var segmentMass: UISegmentedControl!
    @IBOutlet var segmentPolza: UISegmentedControl!
    
    var newArray: [ListRockets]!
    var delegate: UpDataSettingsDelegate!
    var unitHeight: String!
    var unitDiameter: String!
    var unitWeight: String!
    var unitLoad: String!
    
    var unitNumberHeight: String!
//    var unitNumberDiameter: String!
//    var unitNumberWeight: String!
//    var unitNumberLoad: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statesSegmentIndex()
    }
    
    private func statesSegmentIndex() {
        segmentHiegh.selectedSegmentIndex = 1
        segmentDiametr.selectedSegmentIndex = 1
        segmentPolza.selectedSegmentIndex = 1
        unitHeight = "ft"
        unitDiameter = "ft"
        unitWeight = "kg"
        unitLoad = "lb"
        
        unitNumberHeight = "73.0" // старое значения поставить число из модели данных
    }
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.tag {
        case 1:
            unitHeight = segmentHiegh.titleForSegment(at: segmentHiegh.selectedSegmentIndex)
            unitNumberHeight = String((newArray[0].height?.meters)!) // новое значения
        case 2:
            unitDiameter = segmentDiametr.titleForSegment(at: segmentDiametr.selectedSegmentIndex)
           
        case 3:
            unitWeight = segmentMass.titleForSegment(at: segmentMass.selectedSegmentIndex)
           
        default:
            unitLoad = segmentPolza.titleForSegment(at: segmentPolza.selectedSegmentIndex)
           
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        delegate.setSettingsUnits(unitHeight, unitDiameter, unitWeight, unitLoad)
        delegate.setSettingsNumberUnits(unitNumberHeight)
        dismiss(animated: true, completion: nil)
    }
    
}

/*
 @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
         switch sender.tag {
         case 1:
             name1 = sender.titleForSegment(at: sender.selectedSegmentIndex)
         case 2:
             name2 = sender.titleForSegment(at: sender.selectedSegmentIndex)
         case 3:
             name3 = sender.titleForSegment(at: sender.selectedSegmentIndex)
             //name11 = String(newArray[0].height.meters)
         default:
             name4 = sender.titleForSegment(at: sender.selectedSegmentIndex)
             
         }
 */
