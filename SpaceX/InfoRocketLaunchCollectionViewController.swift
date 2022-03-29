//
//  InfoRocketLaunchCollectionViewController.swift
//  Test project - SpaceX. Kontur company
//
//  Created by Maksim  on 21.03.2022.
//

import UIKit



class InfoRocketLaunchCollectionViewController: UICollectionViewController {

    
    var newArray: [RocketLaunches] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(Link.rocketLaunches.rawValue)
    
    }
    
 private func fetchData(_ url: String)  {
        NetworkManager.shered.fetchDataList(url) { data in
            self.newArray = data
            self.collectionView.reloadData()
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
    
    
    
    

   

}

extension InfoRocketLaunchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
    
    
}
