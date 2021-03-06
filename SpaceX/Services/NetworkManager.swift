//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Maksim  on 24.03.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    // MARK: - Loading data from API
    func fetchData<T: Decodable>(dataType: T.Type, url: String, formaterString: String, completion: @escaping(T) -> Void) {
        guard let urlString = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlString) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return }
            do {
                let jsonDecoder = JSONDecoder()
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = formaterString
                jsonDecoder.dateDecodingStrategy = .formatted(dateFormater)
                let type = try jsonDecoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(type)
                }
            } catch {
                print("Error - 🎃")
            }
        }.resume()
    }
    // MARK: - Uploading images from API
    func fetchImage(from url: String?) -> Data? {
        guard let stringUrl = url else { return nil }
        guard let imageURL = URL(string: stringUrl) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}


