
//  StartViewController.swift
//  SpaceX
//
//  Created by Maksim  on 05.04.2022.


import UIKit

class StartViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startpresent()
    }
    
    func startpresent() {
        if let pageVc = storyboard?.instantiateViewController(withIdentifier: "PageVc") as? PageViewController {
            present(pageVc, animated: true, completion: nil)
        }
    }
    
    
   



}
