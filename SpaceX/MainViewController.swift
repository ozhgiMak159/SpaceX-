//
//  MainViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 24.03.2022.
//

import UIKit


class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shered.fetchData(Link.listRocet.rawValue)
    }


}

