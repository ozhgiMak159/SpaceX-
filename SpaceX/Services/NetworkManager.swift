//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Maksim  on 24.03.2022.
//

import Foundation


class NetworkManager {
    
    static let shered = NetworkManager()
    private init() {}
    
    func fetchData(url: String, with completion: @escaping([ListRockets]) -> Void) {
        guard let ulrString = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: ulrString) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "yyyy-MM-dd"
                jsonDecoder.dateDecodingStrategy = .formatted(dateFormater)
                
                let type = try jsonDecoder.decode([ListRockets].self, from: data)
                DispatchQueue.main.async {
                    completion(type)
                }
            } catch {
                print("Error")
            }
        }.resume()
        
    }
    
    func fetchDataList(_ url: String, with completion: @escaping([RocketLaunches]) -> Void) {
        guard let ulrString = URL(string: url) else { return }
        URLSession.shared.dataTask(with: ulrString) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
                jsonDecoder.dateDecodingStrategy = .formatted(dateFormater)
                
                let infoRacket = try jsonDecoder.decode([RocketLaunches].self, from: data)
                DispatchQueue.main.async {
                    completion(infoRacket)
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringUrl = url else { return nil }
        guard let imageURL = URL(string: stringUrl) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
