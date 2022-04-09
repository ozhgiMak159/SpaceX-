//
//  InfoRocketLaunchCollectionViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 21.03.2022.
//

import UIKit

class InfoRocketLaunchCollectionViewController: UICollectionViewController {

    
    var newArray: [RocketLaunches] = []
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchData(Link.rocketLaunches.rawValue)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        activityIndicator.startAnimating()
//        activityIndicator.hidesWhenStopped = true
//        fetchData(Link.rocketLaunches.rawValue)
//    }
//
    
 private func fetchData(_ url: String)  {
        NetworkManager.shered.fetchDataList(url) { data in
            self.newArray = data
            self.newArray.sort(by: { $0.dateUtc > $1.dateUtc })
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
        
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoRocket", for: indexPath) as! DetailInfoRocketCollectionViewCell
        let info = newArray[indexPath.row]
        cell.one(with: info)
        
        return cell
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension InfoRocketLaunchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
}
