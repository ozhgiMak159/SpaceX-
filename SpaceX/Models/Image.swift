//
//  Image.swift
//  SpaceX
//
//  Created by Maksim  on 11.04.2022.
//

import Foundation

class Image {
    func add(one: String, with completion: @escaping() -> Void) -> Data? {
        var add2: Data
        guard let imageData = NetworkManager.shered.fetchImage(from: one) else { return nil }
        DispatchQueue.main.async {
            completion()
        }
        add2 = imageData
        return add2
    }
}
