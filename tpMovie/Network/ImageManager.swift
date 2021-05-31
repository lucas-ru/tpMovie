//
//  ImageManager.swift
//  tpMovie
//
//  Created by lucas on 31/05/2021.
//

import Foundation
import UIKit

class ImageManager {
    var cache: [String: UIImage] = [:]
    
    func getImage(url: URL, completion: @escaping ((UIImage, String) -> Void)) {
        guard let image = cache[url.absoluteString] else {
            NetworkManager.shared.fetchData(url) { data in
                if let image = UIImage(data: data) {
                    self.cache[url.absoluteString] = image
                    completion(image, url.absoluteString)
                }
            }
            return
        }
        completion(image, url.absoluteString)
    }
}
