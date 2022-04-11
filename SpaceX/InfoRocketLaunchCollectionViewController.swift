//
//  InfoRocketLaunchCollectionViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 21.03.2022.
//

import UIKit

class InfoRocketLaunchCollectionViewController: UICollectionViewController {

    
    // MARK: - IBOutlet
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Public propertie
    var newArray: [RocketLaunches] = []
    
    // MARK: - UICollectionViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchData(Link.rocketLaunches.rawValue)
    }
    
    // MARK: - Network
    private func fetchData(_ url: String)  {
        NetworkManager.shered.fetchData(dataType: [RocketLaunches].self, url: url, formater: "yyyy-MM-dd'T'HH:mm:ss.sssZ") { data in
            self.newArray = data
            self.newArray.sort(by: { $0.dateUtc > $1.dateUtc })
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }

    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoRocket", for: indexPath) as! DetailInfoRocketCollectionViewCell
        let info = newArray[indexPath.row]
        cell.one(with: info)
        
        return cell
    }
    
    // MARK: - IBAction
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - SettingConstantsForCell
extension InfoRocketLaunchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
