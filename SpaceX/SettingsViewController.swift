//
//  SettingsViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 19.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    
    var newArray: [ListRockets]!
    var name1: String!
    var name2: String!
    var name3: String!
    var name4: String!
    
    var name11: String!
    
   // var delegate: UpData?

    override func viewDidLoad() {
        super.viewDidLoad()
        unitName()
        add()
    }
    
    private func add() {
        name11 = "1"
    }
    
    // подумать над итерацией
    
    private func unitName() {
        self.name1 = "ft"
        self.name2 = "ft"
        self.name3 = "lb"
        self.name4 = "lb"
    }
    
    
    
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
      
     
    }
    
    @IBAction func cancelButton(_ sender: Any) {
      //  delegate?.upp(text1: name1, text2: name2, text3: name3, text4: name4, text5: name11)
        dismiss(animated: true, completion: nil)
    }
    
    

}
