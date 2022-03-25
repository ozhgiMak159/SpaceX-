//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Maksim  on 24.03.2022.
//

import Foundation

enum Link: String {
    case listRocet = "https://api.spacexdata.com/v4/rockets"
    case rocketLaunches = "https://api.spacexdata.com/v4/launches"
}


class NetworkManager {
    
    static let shered = NetworkManager()
    private init() {}
    
    func fetchData(_ url: String, with completion: @escaping([ListRockets]) -> Void) {
        guard let ulrString = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: ulrString) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "1")
                return
            }
            do {
                let infoRacket = try JSONDecoder().decode([ListRockets].self, from: data)
                DispatchQueue.main.async {
                    completion(infoRacket)
                }
            } catch {
                print("Error")
            }

        }.resume()
}
    
    
    
    
    
    
    
    
    // refactor
    func fetchDataList(_ url: String) {
        guard let ulrString = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: ulrString) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "1")
                return
            }
            do {
                let infoRacket = try JSONDecoder().decode([RocketLaunches].self, from: data)
                    print(infoRacket)
            } catch {
                print("Error")
            }

        }.resume()
    }
    
    
}
